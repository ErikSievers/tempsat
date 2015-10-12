; makefile
api = 2
core = 7.x

; esncard API
projects[esn_esncard_api][type] = module
projects[esn_esncard_api][subdir] = custom
projects[esn_esncard_api][download][type] = git
projects[esn_esncard_api][download][url] = "git@git.esn.org:common/esn_esncard_api.git"
projects[esn_esncard_api][download][branch] = 7.x-1.x
projects[esn_esncard_api][download][full_version] = 7.x-1.x-dev

; webform 4 is also a Satellite 4 dependency
projects[webform][subdir] = contrib
projects[webform][version] = 4.10
