; makefile
api = 2
core = 7.x

projects[context][subdir] = contrib
projects[context][version] = 3.6

projects[ctools][subdir] = contrib
projects[ctools][version] = 1.9

projects[diff][subdir] = contrib
projects[diff][version] = 3.2

projects[features][subdir] = contrib
projects[features][version] = 2.6

; projects[openidadmin][subdir] = contrib
; projects[openidadmin][version] = 1.0

projects[strongarm][subdir] = contrib
projects[strongarm][version] = 2.0

projects[views][subdir] = contrib
projects[views][version] = 3.11

; Modules =====================================================================

projects[date][subdir] = contrib
projects[date][version] = 2.8

projects[ds][subdir] = contrib
projects[ds][version] = 2.11

projects[entitycache][subdir] = contrib
projects[entitycache][version] = 1.x-dev

projects[superfish][subdir] = contrib
projects[superfish][version] = 1.9

projects[admin_menu][subdir] = contrib
projects[admin_menu][version] = 3.0-rc5
; There was a major bug in 3.0-rc4, which has been fixed in rc-5 by https://www.drupal.org/node/2360249

; GIS base modules =====================================================================

projects[geophp][subdir] = contrib/gis
projects[geophp][version] = 1.7

projects[geocoder][subdir] = contrib/gis
projects[geocoder][version] = 1.2

projects[geofield][subdir] = contrib/gis
projects[geofield][version] = 2.3

; for some we don't care about the version, they should not have any impact on any other module
projects[advanced_help][subdir] = contrib
projects[coffee][subdir] = contrib
projects[entity][subdir] = contrib
projects[libraries][subdir] = contrib
projects[module_filter][subdir] = contrib
projects[pathauto][subdir] = contrib
projects[rules][subdir] = contrib
projects[token][subdir] = contrib
projects[transliteration][subdir] = contrib
projects[git_deploy][subdir] = contrib

; Themes ======================================================================

projects[zen][type] = "theme"
projects[zen][version] = 5.5

projects[adminimal_theme][type] = "theme"
projects[adminimal_theme][version] = 1.22

; ESN home grown, we can not miss =============================================

; The galaxy integration
projects[esn_cas][type] = module
projects[esn_cas][subdir] = features
projects[esn_cas][download][type] = git
projects[esn_cas][download][url] = "git@git.esn.org:common/esn_cas.git"
projects[esn_cas][download][branch] = 7.x-1.x
projects[esn_cas][download][full_version] = 7.x-1.x-dev

; The base theme
projects[esnbase][type] = "theme"
projects[esnbase][download][type] = git
projects[esnbase][download][url] = "git@git.esn.org:common/esnbase.git"

; The base theme depends on this module for the colour changes
projects[esn_blocktheme][type] = module
projects[esn_blocktheme][subdir] = custom
projects[esn_blocktheme][download][type] = "git"
projects[esn_blocktheme][download][url] = "git@git.esn.org:common/esn_blocktheme.git"
projects[esn_blocktheme][download][branch] = 7.x-1.x
projects[esn_blocktheme][download][full_version] = 7.x-1.x-dev


