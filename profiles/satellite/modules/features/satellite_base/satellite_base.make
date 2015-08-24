; This is the makefile for satellite_base
; The modules here are hard dependencies for the satellite.
; Modules that are also a dependency of esn_base are in its makefile,
; Modules that could be turned off are in satellite.make

api = 2
core = 7.x

; Modules

projects[addressfield][subdir] = contrib/gis
projects[addressfield][version] = 1.1

projects[ccl][subdir] = contrib
projects[ccl][version] = 1.5

projects[colorbox][subdir] = contrib
projects[colorbox][version] = 2.9

projects[features_override][subdir] = contrib
projects[features_override][version] = 2.0-rc2

projects[link][subdir] = contrib
projects[link][version] = 1.3

projects[manualcrop][subdir] = contrib
projects[manualcrop][version] = 1.5

projects[jquery_update][subdir] = contrib
projects[jquery_update][version] = 2.6

projects[service_links][subdir] = contrib
projects[service_links][version] = 2.3

projects[metatag][subdir] = contrib
projects[metatag][version] = 1.7

; Libraries
libraries[colorbox][download][type] = "get"
libraries[colorbox][download][url] = "https://github.com/jackmoore/colorbox/archive/master.zip"
libraries[colorbox][destination] = "libraries"
libraries[colorbox][directory_name] = "colorbox"

projects[imgareaselect_lib][type] = library
projects[imgareaselect_lib][download][type] = get
projects[imgareaselect_lib][download][url] = http://odyniec.net/projects/imgareaselect/jquery.imgareaselect-0.9.10.zip
projects[imgareaselect_lib][directory_name] = jquery.imgareaselect

libraries[jquery.imagesloaded][download][type] = file
libraries[jquery.imagesloaded][download][url] = https://github.com/desandro/imagesloaded/archive/v2.1.2.tar.gz
libraries[jquery.imagesloaded][download][subtree] = imagesloaded-2.1.2