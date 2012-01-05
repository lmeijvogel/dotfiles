#!/usr/bin/env ruby

require 'fileutils'

basepath = Dir.pwd
Dir.glob("../vim/bundle/*").each do |subdir|
  FileUtils.cd basepath

  puts "Entering #{subdir}"
  FileUtils.cd subdir

  if File.directory?(".git")
    puts 'Updating git repository'
    puts `git pull`
  elsif File.directory?(".hg")
    puts 'Updating hg repository'
    puts `hg pull ; hg update` # Not having to install hg-fetch is nice
  else
    puts "Not a git or hg repository at #{subdir}"
  end

  puts ".. Done"
  puts
end
