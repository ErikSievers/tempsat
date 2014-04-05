<?php

define('SATELLITE_THEME', 'esnsatellite');

/**
 * place blocks during installation.
 */
function satellite_install_place_blocks() {
// enable default blocks
  $blocks = array(
    array(
      'module' => 'system',
      'delta' => 'main',
      'theme' => SATELLITE_THEME,
      'status' => 1,
      'weight' => 0,
      'region' => 'content',
      'visibility' => 0,
      'pages' => '',
      'cache' => -1,
    ),

    array(
      'module' => 'system',
      'delta' => 'help',
      'theme' => SATELLITE_THEME,
      'status' => 1,
      'weight' => 0,
      'region' => 'content',
      'visibility' => 0,
      'pages' => '',
      'cache' => -1,
    ),

    // Spotlight
    array(
      'module' => 'views',
      'delta' => 'spotlight-block',
      'theme' => SATELLITE_THEME,
      'status' => 1,
      'weight' => 0,
      'region' => 'spotlight',
      'visibility' => 1,
      'pages' => '<front>',
      'cache' => -1,
    ),

    // News
    array(
      'module' => 'views',
      'delta' => 'news-block',
      'icon' => 'megaphone',
      'theme' => SATELLITE_THEME,
      'status' => 1,
      'weight' => 0,
      'region' => 'middle_second',
      'visibility' => 1,
      'pages' => '<front>',
      'cache' => -1,
    ),

    // Events
    array(
      'module' => 'views',
      'delta' => 'events-next_events_block',
      'icon' => 'direction',
      'theme' => SATELLITE_THEME,
      'status' => 1,
      'weight' => 0,
      'region' => 'middle_sidebar',
      'visibility' => 1,
      'pages' => '<front>',
      'cache' => -1,
    ),
    array(
      'module' => 'views',
      'delta' => 'events-past_events_block',
      'icon' => 'world', 
      'theme' => SATELLITE_THEME,
      'status' => 1,
      'weight' => 2,
      'region' => 'middle_second',
      'visibility' => 1,
      'pages' => '<front>',
      'cache' => -1,
    ),
    // Calendar
    array(
      'module' => 'views',
      'delta' => 'events_calendar-block',
      'icon' => 'calendar',
      'theme' => SATELLITE_THEME,
      'status' => 1,
      'weight' => 2,
      'region' => 'middle_sidebar',
      'visibility' => 1,
      'pages' => '<front>',
      'cache' => -1,
    ),
    // Partners
    array(
      'module' => 'views',
      'delta' => 'partners-block',
      'icon' => 'briefcase',
      'theme' => SATELLITE_THEME,
      'status' => 1,
      'weight' => 0,
      'region' => 'middle_first',
      'visibility' => 1,
      'pages' => '<front>',
      'cache' => -1,
    ),
    // Aggregator
    array(
      'module' => 'aggregator',
      'delta' => 'category-1',
      'icon' => 'social-rss',
      'theme' => SATELLITE_THEME,
      'status' => 1,
      'weight' => 0,
      'region' => 'middle_first',
      'visibility' => 1,
      'pages' => '<front>',
      'cache' => 1,
    ),
    // Address
    array(
      'module' => 'satellite_settings',
      'delta' => 'address',
      'theme' => SATELLITE_THEME,
      'status' => 1,
      'weight' => 0,
      'region' => 'footer_second',
      'visibility' => 0,
      'pages' => '',
      'cache' => 1,
    ),
    // About us
    array(
      'module' => 'satellite_base',
      'delta' => 'about_us',
      'theme' => SATELLITE_THEME,
      'status' => 1,
      'weight' => 0,
      'region' => 'footer_first',
      'visibility' => 0,
      'pages' => '',
      'cache' => 1,
    ),
    // login button
    array(
      'module' => 'satellite_base',
      'delta' => 'login',
      'theme' => SATELLITE_THEME,
      'status' => 1,
      'weight' => 0,
      'region' => 'footer_bottom',
      'visibility' => 0,
      'pages' => '',
      'cache' => 1,
    ),
    // social media buttons 
    array(
      'module' => 'satellite_socialmedia',
      'delta' => 'socialmedia',
      'theme' => SATELLITE_THEME,
      'status' => 1,
      'weight' => 5,
      'region' => 'footer_bottom',
      'visibility' => 0,
      'pages' => '',
      'cache' => 1,
    ),
  );
  // execute the database query
  $query = db_insert('block')->fields(array('module', 'delta', 'theme', 'status', 'weight', 'region', 'visibility', 'pages', 'cache'));
  foreach ($blocks as $block) {
    if (isset($block['icon'])) {
      // set the default icon
      esn_blocktheme_set_icon($block['module'], $block['delta'], $block['icon']);
      unset($block['icon']);
    }
    $query->values($block);
  }
  $query->execute();
}

/**
 * Install esn.org aggregation
 */
function satellite_install_aggregator() {
  // Adding the ESN international category
  $cid = db_insert('aggregator_category')
    ->fields(array(
      'title' => "ESN International",
      'description' => "ESN International news feed",
      'block' => 5,
    ))
    ->execute();
  // Adding the ESN international feed
  $fid = db_insert('aggregator_feed')
    ->fields(array(
      'title' => "ESN International news",
      'url' => "http://esn.org/news/feed",
      'refresh' => 3600,
      'block' => 5,
      'link' => '',
      'description' => '',
      'image' => '',
    ))
    ->execute();
  // Adding the feed to the category.
  $query = db_insert('aggregator_category_feed')->fields(array( 'fid' => $fid, 'cid' => $cid))->execute();
}

/**
 * set satellite theme
 */
function satellite_install_set_theme() {
  $admin_theme = 'adminimal';
  theme_enable(array(SATELLITE_THEME));
  theme_disable(array('bartik'));
  
  // Enable the default theme.
  db_update('system')
    ->fields(array('status' => 1))
    ->condition('type', 'theme')
    ->condition('name', SATELLITE_THEME)
    ->execute();
  variable_set('theme_default', SATELLITE_THEME);
  
  // Enable the admin theme.
  db_update('system')
    ->fields(array('status' => 1))
    ->condition('type', 'theme')
    ->condition('name', $admin_theme)
    ->execute();
  variable_set('admin_theme', $admin_theme);
  variable_set('node_admin_theme', '1');
}

/**
 * create menu link
 */
function satellite_install_set_menu() {
  // Create a Home link in the main menu.
  $item = array(
    'link_title' => st('Home'),
    'link_path' => '<front>',
    'menu_name' => 'main-menu',
    'weight' => -20,
  );
  menu_link_save($item);

  // Create a Calendar link in the main menu.
  $item = array(
    'link_title' => 'Calendar',
    'link_path' => 'calendar',
    'menu_name' => 'main-menu',
    'weight' => 0,
  );
  menu_link_save($item);
  
  // Create the contact menu item.
  $item = array(
    'link_title' => 'Contact',
    'link_path' => 'contact',
    'menu_name' => 'main-menu',
    'weight' => 10,
  );
  menu_link_save($item);

  // Update the menu router information.
  menu_rebuild();
}

/**
 * set cache settings to cache and aggregate css and js by default
 */
function satellite_install_set_chache_settings() {
  variable_set('cache', TRUE);
  variable_set('cache_lifetime', '3600');
  variable_set('page_cache_maximum_age', '86400');
  variable_set('page_compression', TRUE);
  variable_set('preprocess_css', TRUE);
  variable_set('preprocess_js', TRUE);
}


/**
 * The Satellite configuration form, see: satellite_install_tasks().
 */
function satellite_configuration($form, &$form_state) {
  drupal_set_title(st('Satellite Configuration'));
  
  $form = satellite_settings_configuration_form();
  
  $form['default_content'] = array(
    '#type' => 'fieldset',
    '#title' => st('Default Content'),
    '#collapsible' => false,
    '#collapsed' => false,
    '#class' => array('form-wrapper'),
  );
  $form['default_content']['explanation'] = array(
    '#markup' => st('Dummy content provides you with some content to allow you to see a non empty site. <strong>It will be deleted after one week.</strong>'),
  );
  
  $form['default_content']['enable_content'] = array(
    '#type' => 'checkbox',
    '#title' => st('Add dummy content.'),
    '#default_value' => TRUE,
  );
  
  $form['submit'] = array(
    '#type' => 'submit',
    '#value' => st('Save and continue'),
    '#class' => array('form-submit'),
  );

  return $form;
}
/**
 * The Satellite configuration form validation.
 */
function satellite_configuration_validate($form, &$form_state) {
  return satellite_settings_configuration_form_validate($form_state);
}
/**
 * The Satellite configuration form submission.
 */
function satellite_configuration_submit($form, &$form_state) {
  $satellite_settings = satellite_settings_parse_admin_form($form_state);
  satellite_settings_configure_cas($satellite_settings);
  satellite_settings_save_settings($satellite_settings);
  
  if (satellite_settings_get_name()) {
    variable_set('site_name', satellite_settings_get_name());
  }
  
  if ($form_state['values']['enable_content']) {
    variable_set('satellite_install_default_content', TRUE);
  }
  
}

/**
 * The Satellite configuration, see: satellite_install_tasks().
 *
 * Here we run the second batch of installation tasks.
 */
function satellite_final_install() {
  
  $operations = array();
  $operations[] = array('satellite_disable_cas_if_no_curl', array());
  $operations[] = array('satellite_add_event_audience', array());
  $operations[] = array('satellite_add_event_types', array());

  // We need to revert the field instance of the features with field collections
  $operations[] = array('esn_base_features_revert', array(array('satellite_base')));
  $operations[] = array('esn_base_features_revert', array(array('satellite_news')));
  $operations[] = array('esn_base_features_revert', array(array('satellite_events')));
  $operations[] = array('esn_base_features_revert', array(array('satellite_pages')));
      
  $operations[] = array('satellite_assign_default_roles', array());
  $operations[] = array('satellite_add_contact_form', array());


  if (variable_get('satellite_install_default_content', FALSE)) {
    $operations[] = array('module_enable', array(array('satellite_dummy_content')));

    $default_feeds = array(
      'default_events'   => 'events.xml',
      'default_news'     => 'news.xml',
      'default_pages'    => 'pages.xml',
      'default_partners' => 'partners.xml',
    );
    
    foreach ($default_feeds as $importer_id => $source_file) {
      $operations[] = array('satellite_enable_default_content', array($importer_id, $source_file));
    }
    
    //$operations[] = array('drupal_get_messages', array('status', TRUE)); 
  }
  
  $batch = array(
    'title' => st('Satellite Installation'),
    'init_message' => st('Starting setup'),
    'progress_message' => st('Please wait, completed @current of @total tasks'),
    'error_message' => st('Your satellite needs a specialist! Ask the IT committee!'),
    'operations' => $operations,
  );
  return $batch;

}

function satellite_assign_default_roles() {
  $editor_permissions = array( 
    'create event content',
    'edit own event content',
    'edit any event content',
    'delete own event content',
    'delete any event content',
    'create news content',
    'edit own news content',
    'edit any news content',
    'delete own news content',
    'delete any news content',
    'create partner content',
    'edit own partner content',
    'edit any partner content',
    'delete own partner content',
    'delete any partner content',
    'create page content',
    'edit own page content',
    'edit any page content',
    'delete own page content',
    'delete any page content',
    'override event promote to front page option',
    'override event published option',
    'override news promote to front page option',
    'override news published option',
    'override page promote to front page option',
    'override page published option',
    'override partner promote to front page option',
    'override partner published option',
    'access administration menu',
    'access content overview',
    'access user profiles',
    'administer menu',
    'use text format rich_text',
    'view own unpublished content',
    'view revisions',
    'view the administration theme',
  );

  $editor_role = user_role_load_by_name('editor');
  user_role_grant_permissions($editor_role->rid, $editor_permissions);
  
  $admin_role = user_role_load_by_name('administrator');
  user_role_grant_permissions($admin_role->rid, array_keys(module_invoke_all('permission')));
  variable_set('user_admin_role', $admin_role->rid);

}

function satellite_disable_cas_if_no_curl() {
  $pass = FALSE;
  if (function_exists('curl_version')) {
    $curl_version = curl_version();
    if ((version_compare($curl_version['version'], '7.5.0') >= 0) && ($curl_version['features'] & CURL_VERSION_SSL)) {
      $pass = TRUE;
    }
  }
  if (!$pass) {
    module_disable(array('esn_cas', 'cas', 'cas_attributes', 'cas_roles'));
  }
  else {
    variable_set('cas_roles_roles', '[cas:attribute:sc]_[cas:attribute:roles]');
  }
}

function satellite_add_event_audience() {
  $vocabulary = taxonomy_vocabulary_machine_name_load('event_audience');
  
  $terms = array(
    'An ESNcard of this section required.' => 'An ESNcard of this section required.',
    'Everyone is invited.' => 'Everyone is invited.',
  );
  
  foreach ($terms as $name => $description) {
    $values = array();
    $values['vocabulary_machine_name'] = $vocabulary->machine_name;
    $values['vid'] = $vocabulary->vid;
    $values['name'] = $name;
    $values['description'] = $description;

    $entity = entity_create('taxonomy_term', $values);
    entity_save('taxonomy_term', $entity);
  }
}

function satellite_add_event_types() {
  $vocabulary = taxonomy_vocabulary_machine_name_load('event_type');
  
  $terms = array(
    'Trip' => '#7AC143',
    'Party' => '#EC00BF',
    'Social' => '#F47A20',
    'Cultural' => '#2E3192',
    'Informational' => '#00ADEF',
  );
  
  foreach ($terms as $name => $color) {
    $values = array();
    $values['vocabulary_machine_name'] = $vocabulary->machine_name;
    $values['vid'] = $vocabulary->vid;
    $values['name'] = $name;

    $entity = entity_create('taxonomy_term', $values);
    $wrapper = entity_metadata_wrapper('taxonomy_term', $entity);
    $wrapper->field_calendar_color->set($color);
    $wrapper->save(true);
    entity_save('taxonomy_term', $entity);
  }
}

function satellite_add_contact_form() {
  db_update('contact')
    ->fields(array(
      'category' => 'General contact',
      'recipients' => variable_get('site_mail', ini_get('sendmail_from')),
      'selected' => 1,
      'reply' => '',
    ))
    ->condition('cid', 1)
    ->execute();
}

function satellite_enable_default_content($importer_id, $source_file, &$context) {

  if (empty($context['sandbox'])) {
    $source = feeds_source($importer_id);
    $fetcher_config = $source->getConfigFor($source->importer->fetcher);
    $fetcher_config['source'] = 'profiles/satellite/modules/content/' . $source_file;
    $source->setConfigFor($source->importer->fetcher, $fetcher_config);
    $source->save();
    $context['sandbox']['source'] = $source;
  }
  else {
    $source = $context['sandbox']['source'];
  }
  // process the import
  if (FEEDS_BATCH_COMPLETE != $source->import()) {
    $context['finished'] = 0;
  }
}