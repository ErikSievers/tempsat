
api = 2
core = 7.x

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