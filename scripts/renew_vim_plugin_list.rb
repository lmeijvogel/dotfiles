require 'yaml'

current_path = File.expand_path(File.dirname(__FILE__))
OUTPUT_PATH = File.join(current_path, "vim_bundle.yml" )

VIM_BUNDLE_DIR = File.expand_path(File.join(File.dirname(__FILE__), "../vim/bundle"))

def main
  entries = scan_bundle_directory( VIM_BUNDLE_DIR )

  js = entries.to_yaml

  File.open( OUTPUT_PATH, "w") do |file|
    file.write(js)
  end
end

def scan_bundle_directory( bundle_dir )
  Dir.open bundle_dir do |dir|
    entries = dir.sort.reject {|subdir| subdir == "." || subdir == ".." }

    return entries.map do |subrepo|
      path = File.join( dir.path, subrepo )

      entry_for( path, subrepo )
    end
  end
end

def entry_for( path, name )
  Dir.chdir( path )

  if File.directory?(".git")
    repo_type = "git"
    remotes = `git remote -v`
    remote_fetch_line = remotes.lines.select {|r| r.match /\(fetch\)/}.first
    remote = remote_fetch_line.match( /((?:git|http)[^\s]*)/ ).captures.first
  elsif File.directory?(".hg")
    repo_type = "hg"

    remotes = `hg paths`
    remote_default_line = remotes.lines.select {|r| r.start_with?("default = ") }.first
    remote = remote_default_line.match( /default = (.*)/ ).captures.first
  end

  { name => {"repo_type" => repo_type, "remote" => remote }}
end

main()
