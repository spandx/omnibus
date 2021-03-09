#
# Copyright 2021 YOUR NAME
#
# All Rights Reserved.
#

name "spandx"
maintainer "CHANGE ME"
homepage "https://CHANGE-ME.com"

# Defaults to C:/spandx on Windows
# and /opt/spandx on all other platforms
install_dir "#{default_root}/#{name}"

build_version Omnibus::BuildVersion.semver
build_iteration 1

# Creates required build directories
dependency "preparation"

# spandx dependencies/components
# dependency "somedep"

exclude "**/.git"
exclude "**/bundler/git"
