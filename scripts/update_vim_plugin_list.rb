require 'json'

current_path = File.expand_path(File.dirname(__FILE__))
output_path = File.join(current_path, "vim_bundle.json" )

VIM_BUNDLE_DIR = File.expand_path(File.join(File.dirname(__FILE__), "../vim/bundle"))

def scan_bundle_directory( bundle_dir )
  Dir.open bundle_dir do |dir|
    entries = dir.sort.reject {|entry| entry == "." || entry == ".." }

    return entries.map do |entry|
      Dir.chdir( File.join( dir.path, entry ) )

      if File.exists?(".git")
        repo_type = "git"
        remotes = `git remote -v`
        remote_fetch_line = remotes.lines.select {|r| r.match /\(fetch\)/}.first
        remote = remote_fetch_line.match( /((?:git|http)[^\s]*)/ ).captures.first
      elsif File.exists?(".hg")
        repo_type = "hg"

        remotes = `hg paths`
        remote_default_line = remotes.lines.select {|r| r.start_with?("default = ") }.first
        remote = remote_default_line.match( /default = (.*)/ ).captures.first
      end

      { :name => entry, :repo_type => repo_type, :remote => remote } #BundleEntry.new( entry, repo_type, remote )
    end
  end
end

entries = scan_bundle_directory( VIM_BUNDLE_DIR )

js = JSON.pretty_generate( entries )

File.open( output_path, "w") do |file|
  file.write(js)
end

