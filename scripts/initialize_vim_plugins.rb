#!/usr/bin/env ruby

require 'yaml'
require 'fileutils'

BUNDLE_DIR = File.expand_path( File.join( File.dirname( __FILE__), "../vim/bundle" ) )

# Just to be sure: do not do a rm -rf on any bundle dir
unless BUNDLE_DIR.size < 5
  FileUtils.rm_rf(BUNDLE_DIR)
end

Dir.mkdir(BUNDLE_DIR)

bundle = YAML.load(File.read( "vim_bundle.yml" ))

Dir.chdir( BUNDLE_DIR )

bundle.each do |plugin|
  name = plugin.keys[0]
  data = plugin.values[0]

  puts "Current plugin: #{name}"
  if data["repo_type"] == "git"
    `git clone #{data["remote"]}`
  elsif data["repo_type"] == "hg"
    `hg clone #{data["remote"]}`
  end
end

puts <<INIT_CMD_T

=================================================================

Done. Now perform the following commands to initialize Command-T:
cd ~/.vim/bundle/Command-T/ruby/command-t
rvm use system # If you're using RVM
ruby extconf.rb
make
sudo make install

INIT_CMD_T
