; Satellite FAQ makefile
api = 2
core = 7.x

; contrib module needed, the rest is part of the satellite already for sure

projects[field_collection][subdir] = contrib
projects[field_collection][version] = 1.0-beta11
projects[field_collection][patch][2296473] = https://www.drupal.org/files/issues/field_collection-check-entity-exists-2296473-1.patch
