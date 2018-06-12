#!/usr/bin/env ruby

require "open3"
require 'shellwords'

$LOAD_PATH << File.dirname(__FILE__)

require "_branch_mru"
require "_create_shell_variables"

NoGitRepo = Class.new(StandardError)

# Don't display stack trace on Ctrl-C
trap("INT") { exit 130 }

class NumberedGitBranch
  def initialize(local_or_remote)
    @local_or_remote = local_or_remote
  end

  def branches
    if @local_or_remote == :local
      local_branches
    else
      remote_branches
    end
  end

  def local_branches
    BranchMRU.new.branch_mru
  end

  def remote_branches
    get_branch_names(%r[^refs/remotes/[^/]*/])
  end

  def get_branch_names(prefix)
    all_refs = `git for-each-ref --format '%(refname)'`.each_line.map(&:strip)

    raise NoGitRepo unless $?.success?

    all_refs.select { |ref| ref =~ prefix }.map { |ref| ref.gsub(prefix, "") }
  end
end

def forward_to_normal_git_branch!(argv)
  stdout_or_stderr, = Open3.capture2e("git", "branch", *argv)

  $stderr.puts stdout_or_stderr
end

def show_branch_choice(local_or_remote)
  branches = NumberedGitBranch.new(local_or_remote).branches

  branches.each_with_index do |branch, index|
    formatted_index = "[#{index+1}]"

    puts(format("%4s %s", formatted_index, branch))
  end

  $stdout.write("Select branch: ")

  input = $stdin.gets
  input.strip!

  if input == "r"
    show_branch_choice(:remote)
  elsif input == "l"
    show_branch_choice(:local)
  else
    number = input.to_i

    if 0 < number && number < branches.length + 1
      index = number - 1

      puts `git checkout #{branches[index]}`
    end
  end
end

begin
  if (ARGV - ['--remote', '-r']).empty?
    is_remote = ARGV.include?('--remote') || ARGV.include?('-r')

    show_branch_choice(is_remote ? :remote : :local)
  else
    forward_to_normal_git_branch!(ARGV)
  end
rescue NoGitRepo
  exit 1
end
