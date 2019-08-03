<?php

/**
 * @file
 * Constants needed in satellite.profile as well as satellite.install when satellite.profile is not loaded.
 */

/**
 * Minimum supported version of PHP.
 */
define('SATELLITE_MINIMUM_PHP', '7.1');
/**
 * Recommended version of PHP.
 */
define('SATELLITE_RECOMMENDED_PHP', '7.2');
/**
 * Current Satellite major & minor version
 */
define('SATELLITE_BASE_VERSION', '4.7');
/**
 * Message to show when the minimum or recommended PHP version is not met.
 */
define('SATELLITE_PHP_VERSION_MESSAGE', 'Since <strong>August 5<sup>th</sup> 2019 Satellite 4 requires PHP %version (%recommended recommended).</strong> You are currently using PHP %php.<br />');
/**
 * Link to the ITcom website of ESN International
 */
define('ESN_ITCOM_LINK', 'The <em><a href="https://it.esn.org/" target="_blank">IT committee of ESN International</a>.</em>');
/**
 * Database table name for Satellite messages
 */
define('SATELLITE_NOTIFICATIONS_TABLE', 'satellite_messages');
