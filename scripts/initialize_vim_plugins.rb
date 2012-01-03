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

