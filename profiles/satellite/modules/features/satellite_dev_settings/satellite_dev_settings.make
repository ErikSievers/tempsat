; Core version
; ------------
; Each makefile should begin by declaring the core version of Drupal that all
; projects should be compatible with.
core = 7.x


; API version
; ------------
; Every makefile needs to declare its Drush Make API version. This version of
; drush make uses API version `2`.
api = 2

projects[advanced_help][subdir] = contrib

projects[devel][subdir] = contrib
projects[devel][version] = 1.5

projects[reroute_email][subdir] = contrib

projects[git_deploy][subdir] = contrib/drush
