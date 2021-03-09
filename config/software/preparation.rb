name "preparation"
description "the steps required to prepare the build"
default_version "1.0.0"

license :project_license
skip_transitive_dependency_licensing true

dependency "spandx-ruby"

build do
  block do
    command "mkdir -p #{install_dir}/bin"
    command "mkdir -p #{install_dir}/embedded/bin"
    command "mkdir -p #{install_dir}/embedded/lib"

    env = with_standard_compiler_flags(with_embedded_path)
    gem "install spandx --platform=ruby", env: env
    copy "#{install_dir}/embedded/bin/spandx", "#{install_dir}/bin/spandx"

    delete "#{install_dir}/embedded/share"
  end
end
