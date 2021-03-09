name "preparation"
description "the steps required to prepare the build"
default_version "1.0.0"

license :project_license
skip_transitive_dependency_licensing true

dependency "spandx-ruby"

build do
  block do
    touch "#{install_dir}/embedded/lib/.keep"
    touch "#{install_dir}/embedded/bin/.keep"
    touch "#{install_dir}/bin/.keep"

    gem "install spandx --no-document"
  end
end
