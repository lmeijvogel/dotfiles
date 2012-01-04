require 'yaml'

BUNDLE_DIR = File.expand_path( File.join( File.dirname( __FILE__), "../vim/bundle" ) )

Dir.mkdir(BUNDLE_DIR) unless Dir.exists?(BUNDLE_DIR)

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
