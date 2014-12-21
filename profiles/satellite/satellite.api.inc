<?php
/**
 * Created by PhpStorm.
 * User: Marco
 * Date: 08.12.2014
 * Time: 03:05
 */

function satellite_insert_blocks($blocks) {
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