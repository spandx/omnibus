# frozen_string_literal: true

name "ruby"

license "BSD-2-Clause"
license_file "BSDL"
license_file "COPYING"
license_file "LEGAL"

default_version "3.0.0"

dependency "libffi"
dependency "liblzma"
dependency "libxml2"
dependency "libyaml"
dependency "openssl"
dependency "zlib"

source \
  url: "https://cache.ruby-lang.org/pub/ruby/#{version.match(/^(\d+\.\d+)/)[0]}/ruby-#{version}.tar.gz",
  sha256: "a13ed141a1c18eb967aac1e33f4d6ad5f21be1ac543c344e0d6feeee54af8e28"

relative_path "ruby-#{version}"
embedded_dir = "#{install_dir}/embedded"

build do
  env = with_standard_compiler_flags(with_embedded_path)
  configure_command = [
    "--disable-debug-env",
    "--disable-dtrace",
    "--disable-install-capi",
    "--disable-install-doc",
    "--disable-install-rdoc",
    "--disable-jit-support",
    "--enable-shared",
    "--prefix=#{embedded_dir}",
    "--with-out-ext=dbm,readline,rdoc,win32,win32ole,sdbm",
    "--without-gdbm",
    "--without-gmp",
    "--without-jemalloc",
    "--without-tk",
    "--without-valgrind"
  ]
  configure(*configure_command, env: env)
  make "-j #{workers}", env: env
  make "-j #{workers} install", env: env
end

build do
  %w[benchmark pstore rss test-unit webrick minitest].each do |gem_name|
    delete "#{embedded_dir}/lib/ruby/gems/**/gems/#{gem_name}*"
    delete "#{embedded_dir}/lib/ruby/**/#{gem_name}*"
  end

  delete "#{embedded_dir}/bin/*rac*"
  delete "#{embedded_dir}/bin/erb"
  delete "#{embedded_dir}/bin/irb"
  delete "#{embedded_dir}/bin/rake"
  delete "#{embedded_dir}/bin/rdoc"
  delete "#{embedded_dir}/bin/ri"
  delete "#{embedded_dir}/bin/thor"
  delete "#{embedded_dir}/lib/ruby/gems/**/cache"
  delete "#{embedded_dir}/lib/ruby/gems/**/doc"
  delete "#{embedded_dir}/lib/ruby/gems/**/gems/**/.github"
  delete "#{embedded_dir}/lib/ruby/gems/**/gems/**/.gitignore"
  delete "#{embedded_dir}/lib/ruby/gems/**/gems/**/.travis.yml"
  delete "#{embedded_dir}/lib/ruby/gems/**/gems/**/bundler/man"
  delete "#{embedded_dir}/lib/ruby/gems/**/gems/**/man"
  delete "#{embedded_dir}/lib/ruby/gems/**/gems/**/test"
  delete "#{embedded_dir}/share"
end
