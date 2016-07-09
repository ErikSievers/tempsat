<?php

include_once 'satellite.api.inc';

function satellite_install_tasks_alter(&$tasks, $install_state) {
  // Hide the profile and language selection
  $tasks['install_select_profile']['display'] = false;
  $tasks['install_select_locale']['display'] = false;
  $tasks['install_select_locale']['function'] = 'esn_set_en_default_lang';
  
  // change the theme
  _satellite_set_theme('install');
  
}

function esn_set_en_default_lang(&$install_state) {
  $install_state['parameters']['locale'] = 'en';
}

/**
 * Force-set a theme at any point during the execution of the request.
 *
 * Drupal doesn't give us the option to set the theme during the installation
 * process and forces enable the maintenance theme too early in the request
 * for us to modify it in a clean way.
 */
function _satellite_set_theme($target_theme) {
  if ($GLOBALS['theme'] != $target_theme) {
    unset($GLOBALS['theme']);

    drupal_static_reset();
    $GLOBALS['conf']['maintenance_theme'] = $target_theme;
    _drupal_maintenance_theme();
  }
}


/**
 * Returns a filtered list of _country_get_predefined_list().
 */
function _satellite_get_supported_countries(){
	include_once DRUPAL_ROOT . '/includes/iso.inc';

	$supported_countries = array_keys(esn_galaxy_api_countries());
	$supported_countries = array_fill_keys($supported_countries, 1);
	$all_countries = _country_get_predefined_list();
	$all_countries = array_intersect_key($all_countries, $supported_countries);
	return $all_countries;
}
