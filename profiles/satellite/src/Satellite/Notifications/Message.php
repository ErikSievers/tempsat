<?php

namespace ESN\Satellite\Notifications;

use ESN\Conditional\ConditionParser;
use ESN\Conditional\Runtime\RolesCondition;
use PharIo\Version\Version;
use PharIo\Version\VersionConstraint;
use PharIo\Version\VersionConstraintParser;

class Message implements \JsonSerializable {

  /** @var string */
  private $title;

  /** @var string */
  private $content;

  /** @var string */
  private $type;

  /** @var string CSS to inject into the page */
  private $inject_css;

  /** @var string Additional CSS class for the HTML body */
  private $body_class;

  /** @var MessageDisplayPeriod */
  private $display;

  /** @var VersionConstraint */
  private $version;

  /** @var ConditionParser */
  private $conditions;

  public function setVersion($value) {
    $parser = new VersionConstraintParser();
    $constraint = $parser->parse($value);
    $this->version = $constraint;
  }

  /**
   * Verify that the message is provided for this version of Satellite
   *
   * @param Version $installed Satellite version installed
   *
   * @return bool
   */
  public function verifyVersion($installed) {
    return !isset($this->version) || $this->version->complies($installed);
  }

  /**
   * @return string
   */
  public function getTitle() {
    return $this->title;
  }

  /**
   * @return string
   */
  public function getContent() {
    return $this->content;
  }

  /**
   * @return string
   */
  public function getType() {
    return $this->type;
  }

  /**
   * @return \ESN\Satellite\Notifications\MessageDisplayPeriod
   */
  public function getDisplay() {
    return $this->display;
  }

  /**
   * Specify data which should be serialized to JSON
   *
   * @link https://php.net/manual/en/jsonserializable.jsonserialize.php
   * @return mixed data which can be serialized by <b>json_encode</b>,
   * which is a value of any type other than a resource.
   * @since 5.4.0
   */
  public function jsonSerialize() {
    $data = new \stdClass();
    $data->title = $this->title;
    $data->content = $this->content;
    $data->type = $this->type;
    $data->version = $this->version->asString();
    $data->display = new \stdClass();
    $data->display = $this->display->jsonSerialize();
    $data->conditions = $this->conditions->jsonSerialize();
    return $data;
  }

  /**
   * @param object $conditions
   */
  public function setConditions($conditions) {
    $this->conditions = new ConditionParser($conditions);
  }

  /**
   * Verify that all conditions applied to this message are fulfilled before rendering it.
   *
   * @return bool
   */
  public function verifyConditions() {
    if (!isset($this->conditions)) {
      return FALSE;
    }
    $conditions = RolesCondition::ensureRolesCondition($this->conditions);
    return $conditions->isOK();
  }

  public function render() {
    $title = $this->getTitle();
    $html = '';
    if ('NO_MESSAGE' !== $title) {
      $html .= "<h3><strong>{$this->getTitle()}</strong></h3>";

      $replacements = $this->conditions->getReplacements();
      $html .= format_string($this->getContent(), $replacements);
    }

    return $html;
  }

  /**
   * @return string
   */
  public function getInjectCss() {
    return $this->inject_css;
  }

  /**
   * @param string $inject_css
   */
  public function setInjectCss(string $inject_css) {
    $this->inject_css = $inject_css;
  }

  /**
   * @return string
   */
  public function getBodyClass() {
    return $this->body_class;
  }

  /**
   * @param string $body_class
   */
  public function setBodyClass($body_class) {
    $this->body_class = $body_class;
  }
}
