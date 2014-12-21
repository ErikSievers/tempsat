; This is the makefile for satellite_base
; The modules here are hard dependencies for the satellite.
; Modules that are also a dependency of esn_base are in its makefile,
; Modules that could be turned off are in satellite.make

api = 2
core = 7.x

; Modules

projects[ccl][subdir] = contrib
projects[ccl][version] = 1.5

projects[colorbox][subdir] = contrib
projects[colorbox][version] = 1.6

projects[features_override][subdir] = contrib
projects[features_override][version] = 2.0-rc2

projects[link][subdir] = contrib
projects[link][version] = 1.3

projects[manualcrop][subdir] = contrib
projects[manualcrop][version] = 1.x-dev

projects[jquery_update][subdir] = contrib
projects[jquery_update][version] = 2.4

projects[service_links][subdir] = contrib
projects[service_links][version] = 2.2

projects[metatag][subdir] = contrib
projects[metatag][version] = 1.4

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