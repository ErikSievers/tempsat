; Satellite makefile
;
; you can run this makefile with the following command if you don't want to rebuild the entire satellite:
; drush make --no-core --contrib-destination=profiles/satellite/ profiles/satellite/satellite.make .
api = 2
core = 7.x

; ESN common parts ========================================================

projects[esn_base][type] = module
projects[esn_base][subdir] = features
projects[esn_base][download][type] = git
projects[esn_base][download][url] = "git@git.esn.org:common/esn_base.git"
projects[esn_base][download][branch] = 7.x-1.x
projects[esn_base][download][full_version] = 7.x-1.x-dev

projects[esn_galaxy_api][type] = module
projects[esn_galaxy_api][subdir] = custom
projects[esn_galaxy_api][download][type] = git
projects[esn_galaxy_api][download][url] = "git@git.esn.org:common/esn_galaxy_api.git"
projects[esn_galaxy_api][download][branch] = 7.x-1.x
projects[esn_galaxy_api][download][full_version] = 7.x-1.x-dev

projects[esn_wysiwyg][type] = module
projects[esn_wysiwyg][subdir] = features
projects[esn_wysiwyg][download][type] = git
projects[esn_wysiwyg][download][url] = "git@git.esn.org:common/esn_wysiwyg.git"
projects[esn_wysiwyg][download][branch] = 7.x-1.x
projects[esn_wysiwyg][download][full_version] = 7.x-1.x-dev


; Extra Satellite features ========================================================
; These features are good candidates to become apps in the future

; FAQ field for events (and other content types)
projects[satellite_faq][type] = module
projects[satellite_faq][subdir] = features
projects[satellite_faq][download][type] = git
projects[satellite_faq][download][url] = "git@git.esn.org:satellite/satellite_faq.git"
projects[satellite_faq][download][branch] = 7.x-1.x
projects[satellite_faq][download][full_version] = 7.x-1.x-dev

; Settings for creating default content
; projects[satellite_dev_settings][type] = module
; projects[satellite_dev_settings][subdir] = features
; projects[satellite_dev_settings][download][type] = git
; projects[satellite_dev_settings][download][url] = "git@git.esn.org:satellite/satellite_dev_settings.git"
; projects[satellite_dev_settings][download][branch] = 7.x-1.x
; projects[satellite_dev_settings][download][full_version] = 7.x-1.x-dev

; National and international partners
; projects[satellite_partners_external][type] = module
; projects[satellite_partners_external][subdir] = features
; projects[satellite_partners_external][download][type] = git
; projects[satellite_partners_external][download][url] = "git@git.esn.org:satellite/satellite_partners_external.git"
; projects[satellite_partners_external][download][branch] = 7.x-1.x
; projects[satellite_partners_external][download][full_version] = 7.x-1.x-dev

; esncard.org discounts
; projects[satellite_discounts][type] = module
; projects[satellite_discounts][subdir] = features
; projects[satellite_discounts][download][type] = git
; projects[satellite_discounts][download][url] = "git@git.esn.org:satellite/satellite_discounts.git"
; projects[satellite_discounts][download][branch] = 7.x-1.x
; projects[satellite_discounts][download][full_version] = 7.x-1.x-dev

; Satellite team member
projects[satellite_team][type] = module
projects[satellite_team][subdir] = features
projects[satellite_team][download][type] = git
projects[satellite_team][download][url] = "git@git.esn.org:satellite/satellite_team.git"
projects[satellite_team][download][branch] = 7.x-1.x
projects[satellite_team][download][full_version] = 7.x-1.x-dev

; esncard component for webforms
projects[webform_esncard][type] = module
projects[webform_esncard][subdir] = custom
projects[webform_esncard][download][type] = git
projects[webform_esncard][download][url] = "git@git.esn.org:common/webform_esncard.git"
projects[webform_esncard][download][branch] = 7.x-1.x
projects[webform_esncard][download][full_version] = 7.x-1.x-dev

; Modules =====================================================================

projects[better_formats][subdir] = contrib
projects[better_formats][version] = 1.0-beta1

projects[calendar][subdir] = contrib
projects[calendar][version] = 3.4
; get rid of a bunch of notices with php 5.4
projects[calendar][patch][1471400] = http://drupal.org/files/issues/calendar-illegal_offset-1471400-78.patch

projects[date][subdir] = contrib
projects[date][version] = 2.7

projects[entity][subdir] = contrib
projects[entity][version] = 1.4

projects[eu-cookie-compliance][subdir] = contrib
projects[eu-cookie-compliance][version] = 1.8

projects[feature_set][subdir] = contrib
projects[feature_set][version] = 1.1

projects[features_override][subdir] = contrib
projects[features_override][version] = 2.0-rc1

projects[feeds][subdir] = contrib
projects[feeds][version] = 2.0-alpha8

projects[feeds_xpathparser][subdir] = contrib
projects[feeds_xpathparser][version] = 1.0-beta4

projects[field_group][subdir] = contrib
projects[field_group][version] = 1.3

projects[imagecache_actions][subdir] = contrib
projects[imagecache_actions][version] = 1.4

projects[job_scheduler][subdir] = contrib
projects[job_scheduler][version] = 2.0-alpha3

projects[link][subdir] = contrib
projects[link][version] = 1.2

projects[menu_block][subdir] = contrib
projects[menu_block][version] = 2.3

projects[migrate][subdir] = contrib
projects[migrate][version] = 2.5

projects[mimemail][subdir] = contrib
projects[mimemail][version] = 1.0-beta3

projects[options_element][subdir] = contrib
projects[options_element][version] = 1.10

projects[override_node_options][subdir] = contrib
projects[override_node_options][version] = 1.12

projects[paranoia][subdir] = contrib
projects[paranoia][version] = 1.0

projects[seckit][subdir] = contrib
projects[seckit][version] = 1.5

projects[security_review][subdir] = contrib
projects[security_review][version] = 1.0

projects[simplenews][subdir] = contrib
projects[simplenews][version] = 1.1

projects[textformatter][subdir] = contrib
projects[textformatter][version] = 1.3

projects[webform][subdir] = contrib
projects[webform][version] = 4.0-beta3

projects[weight][subdir] = contrib
projects[weight][version] = 2.3

; WYSIWYG improvements
projects[imce][subdir] = contrib
projects[imce][version] = 1.8

projects[imce_wysiwyg][subdir] = contrib
projects[imce_wysiwyg][version] = 1.0

projects[linkit][subdir] = contrib
projects[linkit][version] = 3.1

; projects[insert][subdir] = contrib
; projects[insert][version] = 1.3

; projects[markdown][subdir] = contrib
; projects[markdown][version] = 1.1


; Satellite Base ==============================================================

; Modules
projects[colorbox][subdir] = contrib
projects[colorbox][version] = 1.6

projects[manualcrop][subdir] = contrib
projects[manualcrop][version] = 1.x-dev

projects[jquery_update][subdir] = contrib
projects[jquery_update][version] = 2.3

; Libraries
libraries[colorbox][download][type] = "get"
libraries[colorbox][download][url] = "https://github.com/jackmoore/colorbox/archive/master.zip"
libraries[colorbox][destination] = "libraries"
libraries[colorbox][directory_name] = "colorbox"

projects[imgareaselect_lib][type] = library
projects[imgareaselect_lib][download][type] = get
projects[imgareaselect_lib][download][url] = http://odyniec.net/projects/imgareaselect/jquery.imgareaselect-0.9.10.zip
projects[imgareaselect_lib][directory_name] = jquery.imgareaselect

projects[imagesloaded_lib][type] = library
projects[imagesloaded_lib][download][type] = file
projects[imagesloaded_lib][download][url] = http://desandro.github.io/imagesloaded/imagesloaded.pkgd.min.js
projects[imagesloaded_lib][download][filename] = jquery.imagesloaded.min.js
projects[imagesloaded_lib][directory_name] = jquery.imagesloaded


; Satellite Spotlight ========================================================

; Modules

projects[flexslider][subdir] = contrib
projects[flexslider][version] = 2.0-alpha3

projects[flexslider_views_slideshow][subdir] = contrib

projects[views_slideshow][subdir] = contrib
projects[views_slideshow][version] = 3.1

; Libraries

libraries[flexslider][download][type] = "get"
libraries[flexslider][download][url] = "https://github.com/woothemes/FlexSlider/archive/master.zip"
libraries[flexslider][destination] = "libraries"
libraries[flexslider][directory_name] = "flexslider"

libraries[json2][download][type] = "get"
libraries[json2][download][url] = "https://github.com/douglascrockford/JSON-js/archive/master.zip"
libraries[json2][destination] = "libraries"
libraries[json2][directory_name] = "json2"

libraries[jquery_cycle_library][download][type] = "get"
libraries[jquery_cycle_library][download][url] = "http://malsup.github.com/jquery.cycle.all.js"
libraries[jquery_cycle_library][directory_name] = "jquery.cycle"
libraries[jquery_cycle_library][destination] = "libraries"

; Navbar test ====

; projects[navbar][subdir] = contrib
; projects[navbar][version] = 1.0-alpha10

; projects[breakpoints][subdir] = contrib
; projects[breakpoints][version] = 1.1

; libraries[backbone][download][type] = "get"
; libraries[backbone][download][url] = "https://github.com/jashkenas/backbone/archive/1.1.0.zip"
; libraries[backbone][destination] = "libraries"
; libraries[backbone][directory_name] = "backbone"





