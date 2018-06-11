#!/usr/bin/env ruby

require "open3"

$LOAD_PATH << File.dirname(__FILE__)

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
##########################################
require 'shellwords'

class ReflogEntry
  attr_accessor :sha, :ref, :action, :message

  def initialize(sha, ref, action, message)
    self.sha = sha
    self.ref = ref
    self.action = action
    self.message = message
  end

  def to_s
    "#{sha} #{ref} #{action} #{message}"
  end
end

class BranchMRU
  def initialize
    @branch_existence_registry = {}
  end

  def branch_mru
    sorted_branch_names.select do |branch_name|
      branch_exists?(branch_name)
    end
  end

  private

  def sorted_branch_names
    branch_names = checkouts.map do |checkout|
      matches = checkout.message.match(%r{moving from (?:[0-9a-zA-Z\-/]+) to ([0-9a-zA-Z\-/]+)})

      matches[1]
    end.uniq

    branch_names.sort do |one, two|
      if one == "master"
        -1
      elsif two == "master"
        1
      else
        0
      end
    end
  end

  def checkouts
    logs = `git reflog`.split("\n")

    reflog_entries = logs.map do |line|
      match = line.match(/([0-9a-f]+)\s+([^:]+):\s+([^:]+):\s+(.*)/)

      ReflogEntry.new(*match[1..-1])
    end

    reflog_entries.select { |entry| entry.action == "checkout" }
  end

  def branch_exists?(branch_name)
    if @branch_existence_registry.key?(branch_name)
      return @branch_existence_registry[branch_name]
    end

    `git rev-parse --verify refs/heads/#{Shellwords.shellescape(branch_name)} 2>/dev/null`

    @branch_existence_registry[branch_name] = $?.success?
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
