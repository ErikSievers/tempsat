<?php
/**
 * @file
 * Load the Sections in the database.
 */

function _sanitize_website($url) {
  if (!empty($url)) {
    // Sanitize urls  without protocol.
    if (strpos($url, 'http://') === FALSE && strpos($url, 'https://') === FALSE) {
      $url = 'http://' . $url;
    }
    if (valid_url($url, TRUE)) {
      return $url;
    }
  }
  return '';
}

/**
 * Populate the database with ESN sections from Galaxy.
 */
function _esn_galaxy_api_save_sections($local = FALSE) {
  $updates = _esn_galaxy_api_download_sections($local);
  $last_updated = date_now()->getTimestamp();
  $count_created = 0;
  $count_updated = 0;
  $count_deleted = 0;
  $sections = esn_section_load_multiple();
  $countries = esn_country_load_all();
  foreach ($updates as $update) {
    $code = $update['sc'];
    if (array_key_exists($code, $sections)) {
      $section = $sections[$code];
      unset($sections[$code]);
      $count_updated++;
    }
    else {
      $section = esn_section_create(array('code' => $code));
      $count_created++;
    }

    $section->country_code->set($update['c']);
    // TODO: Add country reference.
    if (array_key_exists($update['c'], $countries)) {
      $country = $countries[$update['c']];
      $section->country = $country->getIdentifier();
    }

    $section->name->set($update['sectionname']);
    $section->city->set($update['l']);
    $section->street->set($update['street']);
    $section->postaladdress->set($update['postaladdress']);
    $lon = floatval($update['longitude']);
    $lat = floatval($update['latitude']);
    if (strlen($update['longitude']) > 0 && $lon != 0.0 && strlen($update['latitude']) > 0 && $lat != 0.0) {
      $section->longitude->set($lon);
      $section->latitude->set($lat);
    }
    $section->website->set(_sanitize_website($update['website']));
    if (isset($update['site_logo'])) {
      $section->website_logo->set(_sanitize_website($update['site_logo']));
    }
    $section->last_updated->set($last_updated);
    $section->save();
  }

  // Now the remaining countries in database are not in the update from Galaxy, so remove them.
  foreach ($sections as $section) {
    esn_section_delete($section);
    $count_deleted++;
  }
  watchdog('esn_galaxy_api', 'Updated ESN Sections: %created created, %updated updated, %deleted deleted',
    array(
      '%created' => $count_created,
      '%updated' => $count_updated,
      '%deleted' => $count_deleted
    ));
}

/**
 * Download the ESN sections from Galaxy.
 */
function _esn_galaxy_api_download_sections($local = FALSE) {

  if (!$local) {
    $xml = @simplexml_load_file('https://accounts.esn.org/sections/xml');
  }
  if (!$xml) {
    watchdog('esn_galaxy_api', 'The list of ESN sections could not be fetched from Galaxy! The backup was used.', array(), WATCHDOG_WARNING);
    $xml = simplexml_load_file(drupal_get_path('module', 'esn_galaxy_api') . '/sections.xml');
  }

  $sections = array();
  foreach ((array) $xml as $node) {
    foreach ($node as $index => $section) {
      $sections[((string) $section->sc)] = _esn_galaxy_api_process_metadata(_esn_galaxy_api_xml2array($section));
    }
  }

  return $sections;
}

/**
 * Populate the database with ESN countries from Galaxy.
 */
function _esn_galaxy_api_save_countries($local = FALSE) {
  $updates = _esn_galaxy_api_download_countries($local);
  $last_updated = date_now()->getTimestamp();
  $count_created = 0;
  $count_updated = 0;
  $count_deleted = 0;
  $countries = esn_country_load_multiple();
  foreach ($updates as $update) {
    $code = $update['c'];
    if (array_key_exists($code, $countries)) {
      $country = $countries[$code];
      unset($countries[$code]);
      $count_updated++;
    }
    else {
      $country = esn_country_create(array('code' => $code));
      $count_created++;
    }
    $country->country_name->set($update['cn']);
    $country->name->set('ESN ' . $update['cn']);
    $country->website->set(_sanitize_website($update['website']));
    if (isset($update['site_logo'])) {
      $country->website_logo->set(_sanitize_website($update['site_logo']));
    }
    $country->last_updated->set($last_updated);
    $country->save();
  }

  // Now the remaining countries in database are not in the update from Galaxy, so remove them.
  foreach ($countries as $country) {
    esn_country_delete($country);
    $count_deleted++;
  }
  watchdog('esn_galaxy_api', 'Updated ESN Countries: %created created, %updated updated, %deleted deleted',
    array(
      '%created' => $count_created,
      '%updated' => $count_updated,
      '%deleted' => $count_deleted
    ));
}

/**
 * Download the ESN countries from Galaxy.
 */
function _esn_galaxy_api_download_countries($local = FALSE) {

  if (!$local) {
    $xml = @simplexml_load_file('https://accounts.esn.org/countries/xml');
  }
  if (!$xml) {
    watchdog('esn_galaxy_api', 'The list of ESN countries could not be fetched from Galaxy! The backup was used.', array(), WATCHDOG_WARNING);
    $xml = simplexml_load_file(drupal_get_path('module', 'esn_galaxy_api') . '/countries.xml');
  }

  $countries = array();
  foreach ((array) $xml as $node) {
    foreach ($node as $index => $country) {
      $countries[((string) $country->c)] = _esn_galaxy_api_process_metadata(_esn_galaxy_api_xml2array($country));
    }
  }

  return $countries;
}

function _esn_galaxy_api_process_metadata($item) {
  $enabled = &drupal_static(__FUNCTION__ . '::site-logo', FALSE);
  if ($enabled === NULL) {
    $enabled = variable_get('esn_galaxy_api_check_site_logo', FALSE);
  }
  if ($item) {
    // If we have a website, check if it supports 'site-logo' url.
    if ($enabled && isset($item['website']) && !empty($item['website'])) {
      $website = $item ['website'];
      if (!Strings::endsWith($website, '/')) {
        $website .= '/';
      }
      if (!Strings::startsWith($website, array('http://', 'https://'))) {
        $website = 'http://' . $website;
      }
      $website .= 'site-logo';
      $item['site_logo'] = HttpUtility::getUrlStatus($website . 'site-logo') ? $website : '';
    }
  }
  return $item;
}

/**
 * Translate SimpleXML to array.
 */
function _esn_galaxy_api_xml2array($xml) {

  $arr = array();
  foreach ($xml as $element) {
    $tag = $element->getName();
    $e = get_object_vars($element);
    if (!empty($e)) {
      $arr[$tag] = $element instanceof SimpleXMLElement ? _esn_galaxy_api_xml2array($element) : $e;
    }
    else {
      $arr[$tag] = trim($element);
    }
  }
  return $arr;
}
