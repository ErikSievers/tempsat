<?php

namespace ESN\Satellite\Notifications;

use ESN\Satellite\VersionHelper;
use JsonException;

define ('NotificationManager_FILENAME', 'satellite-messages.json');
define ('NotificationManager_DOWNLOAD_DIRECTORY', 'public://esn/');
define ('NotificationManager_MessagesSourceUrl', 'satellite_notification_messages_url');

class NotificationManager {

  /**
   * @var \ESN\Satellite\Notifications\Message[]
   */
  private $messages;
  private $version;

  /**
   * NotificationManager constructor.
   *
   * @param Message[] $messages
   */
  private function __construct($messages, $version) {
    $this->messages = $messages;
    $this->version = $version;
  }

  private static function getInstalledVersion() {
    $profile = system_get_info('module', 'satellite');
    $version = $profile['version'];
    if (!$version) {
      $version = SATELLITE_BASE_VERSION . '-dev';
    }
    // Make version string SemVer compatible (old ones might not be)
    return VersionHelper::getSemVer($version);
  }

  private static function initDataStorage() {
    $dir = NotificationManager_DOWNLOAD_DIRECTORY;
    return file_prepare_directory($dir, FILE_CREATE_DIRECTORY | FILE_MODIFY_PERMISSIONS);
  }

  public static function update() {
    if (!self::initDataStorage()) {
      return NULL;
    }
    $url = variable_get(NotificationManager_MessagesSourceUrl,
      'https://satellite.esn.org/notifications/' . NotificationManager_FILENAME
    );
    $url = url($url, ['absolute' => TRUE]);
    $file = system_retrieve_file($url, NotificationManager_DOWNLOAD_DIRECTORY . NotificationManager_FILENAME,
      TRUE,
      FILE_EXISTS_REPLACE
    );
    if ($file instanceof \stdClass && empty($usage = file_usage_list($file)) || !array_key_exists('satellite_profile', $usage)) {
      file_usage_add($file, 'satellite_profile', __CLASS__, 1, 1);
    }

    return self::load();
  }

  public static function load() {
    $version = self::getInstalledVersion();
    $messages = [];
    foreach (self::parseFile(NotificationManager_DOWNLOAD_DIRECTORY . NotificationManager_FILENAME) as $message) {
      if ($message->verifyVersion($version)) {
        $messages[] = $message;
      }
    }

    return new static($messages, $version);
  }

  /**
   * @param \ESN\Satellite\Notifications\NotificationManager|null $manager
   *
   * @return \ESN\Satellite\Notifications\NotificationManager|null
   */
  public static function cache($manager = NULL, $autoload = FALSE) {
    global $user;
    $uid = (int)$user->uid;
    $cache = &drupal_static(__CLASS__);
    if (!$cache) {
      $cache = new \stdClass();
    }
    if ($manager || $autoload) {
      if (!$manager && $autoload) {
        $manager = self::load();
      }
      $cache->$uid = $manager;
    }

    return isset($cache->$uid)
      ? $cache->$uid
      : NULL;
  }

  public static function requirements() {
    $t = get_t();

    $requirements['satellite_notifications'] = [
      'title' => $t('Satellite Notifications'),
      'value' => format_string('<a href="!url">Manually update</a> Satellite notifications ', [
        '!url' => '/admin/settings/satellite/notifications/update',
      ]),
      'severity' => REQUIREMENT_INFO,
    ];

    return $requirements;
  }

  public function getUserMessagesRaw() {
    try {
      $messages = drupal_json_encode($this->messages);
    }catch (\Exception $ex) {
      $messages = '';
    }

    return $messages;
  }

  /**
   * @param $file
   *
   * @return Message[]
   */
  private static function parseFile($file) {
    try {
      $json = drupal_json_decode(file_get_contents($file));
      if (is_null($json)) {
        $error = json_last_error_msg();
        throw new \Exception($error, json_last_error());
      }
      return self::parse($json);
    }catch (\Exception $ex) {
      return [];
    }
  }

  /**
   * @param $json
   *
   * @return Message[]
   */
  private static function parse($json) {
    try {
      $mapper = new \JsonMapper();
      $mapper->bIgnoreVisibility = TRUE;
      $mapper->bEnforceMapType = false;
      $messages = $mapper->mapArray($json, [], Message::class);
    }catch (\Exception $ex) {
      $messages = [];
    }
    return $messages;
  }

  public function renderMessages() {
    foreach ($this->getMessages() as $message) {
      drupal_set_message($message->render(), $message->getType(), FALSE);
    }
  }

  /**
   * @return \ESN\Satellite\Notifications\Message[]
   */
  public function getMessages() {
    $messages = [];
    foreach ($this->messages as $message) {
      if (!$message->verifyVersion($this->version)) {
        continue;
      }
      if (!$message->getDisplay()->isValid()) {
        continue;
      }
      if (!$message->verifyConditions()) {
        continue;
      }
      $messages[] = $message;
    }
    return $messages;
  }
}
