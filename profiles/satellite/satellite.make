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

; Satellite Blog
projects[satellite_blog][type] = module
projects[satellite_blog][subdir] = features
projects[satellite_blog][download][type] = git
projects[satellite_blog][download][url] = git@git.esn.org:satellite/satellite_blog.git
projects[satellite_blog][download][branch] = master
projects[satellite_blog][download][full_version] 7.x-1.x-dev

; Satellite features with makefiles ===========================================
; The modules in the respective makefiles are required for the feature to work.

includes[satellite_base] = "modules/features/satellite_base/satellite_base.make"

includes[satellite_events] = "modules/features/satellite_events/satellite_events.make"

includes[satellite_spotlight] = "modules/features/satellite_spotlight/satellite_spotlight.make"

includes[satellite_socialmedia_integration] = "modules/features/satellite_socialmedia_integration/satellite_socialmedia_integration.make"


; Modules =====================================================================
; Modules here can be turned on or off by webmatsers.
; The default ones are turned on in satellite.info

projects[better_formats][subdir] = contrib
projects[better_formats][version] = 1.0-beta1

projects[eu-cookie-compliance][subdir] = contrib
projects[eu-cookie-compliance][version] = 1.8

; projects[feature_set][subdir] = contrib
; projects[feature_set][version] = 1.1

projects[feeds][subdir] = contrib
projects[feeds][version] = 2.0-alpha8

projects[feeds_xpathparser][subdir] = contrib
projects[feeds_xpathparser][version] = 1.0

projects[field_group][subdir] = contrib
projects[field_group][version] = 1.4

projects[imagecache_actions][subdir] = contrib
projects[imagecache_actions][version] = 1.5

projects[job_scheduler][subdir] = contrib
projects[job_scheduler][version] = 2.0-alpha3

projects[menu_block][subdir] = contrib
projects[menu_block][version] = 2.3

; projects[migrate][subdir] = contrib
; projects[migrate][version] = 2.5

projects[mimemail][subdir] = contrib
projects[mimemail][version] = 1.0-beta3

projects[multiupload_filefield_widget][subdir] = contrib
projects[multiupload_filefield_widget][version] = 1.13

projects[multiupload_imagefield_widget][subdir] = contrib
projects[multiupload_imagefield_widget][version] = 1.3

projects[options_element][subdir] = contrib
projects[options_element][version] = 1.10

projects[override_node_options][subdir] = contrib
projects[override_node_options][version] = 1.13

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
projects[weight][version] = 2.4

; WYSIWYG improvements
projects[imce][subdir] = contrib
projects[imce][version] = 1.9

projects[imce_wysiwyg][subdir] = contrib
projects[imce_wysiwyg][version] = 1.0

projects[linkit][subdir] = contrib
projects[linkit][version] = 3.2

; projects[insert][subdir] = contrib
; projects[insert][version] = 1.3







