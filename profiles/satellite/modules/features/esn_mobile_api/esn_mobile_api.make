; makefile
api = 2
core = 7.x


projects[services][subdir] = contrib
projects[services][version] = 3.12

projects[services_views][subdir] = contrib
projects[services_views][version] = 1.0
projects[services_views][patch][2175227] = https://www.drupal.org/files/issues/services-views-7.x-1.0_rest-service-allows-limit-offset_2151389_2175227.patch

projects[image_url_formatter][subdir] = contrib
projects[image_url_formatter][version] = 1.4

projects[views_php][subdir] = contrib
projects[views_php][version] = 1.0-alpha1

projects[uuid][subdir] = contrib
projects[uuid][version] = 1.0-alpha6
