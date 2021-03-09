name "spandx"
maintainer "mo khan <mo@mokhan.ca>"
homepage "https://github.com/spandx"

install_dir "#{ENV.fetch("GITHUB_WORKSPACE", default_root)}/#{name}"

build_version Omnibus::BuildVersion.semver
build_iteration 1

# Creates required build directories
dependency "preparation"

# spandx dependencies/components
# dependency "somedep"

exclude "**/.git"
exclude "**/bundler/git"
