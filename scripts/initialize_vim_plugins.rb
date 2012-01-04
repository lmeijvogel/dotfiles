require 'json'

BUNDLE_DIR = File.expand_path( File.join( File.dirname( __FILE__), "../vim/bundle" ) )

Dir.mkdir(BUNDLE_DIR) unless Dir.exists?(BUNDLE_DIR)

bundle = JSON.parse(File.read( "vim_bundle.json" ))

Dir.chdir( BUNDLE_DIR )

bundle.each do |plugin|
  puts "Current plugin: #{plugin["name"]}"
  if plugin["repo_type"] == "git"
    `git clone #{plugin["remote"]}`
  elsif plugin["repo_type"] == "hg"
    `hg clone #{plugin["remote"]}`
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
