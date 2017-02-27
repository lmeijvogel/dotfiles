#!/usr/bin/env ruby

require 'open3'

$LOAD_PATH << File.dirname(__FILE__)

require '_create_shell_variables'

NoGitRepo = Class.new(StandardError)

class NumberedGitBranch
  def initialize(local_or_remote)
    @local_or_remote = local_or_remote
  end

  def perform
    shell_variables = CreateShellVariables.new

    shell_variables.perform(branches)
  rescue NoGitRepo
    # Error was already printed
  end

  def branches
    if @local_or_remote == :local
      local_branches
    else
      remote_branches
    end
  end

  def local_branches
    get_branch_names(%r[^refs/heads/])
  end

  def remote_branches
    get_branch_names(%r[^refs/remotes/[^/]*/])
  end

  def get_branch_names(prefix)
    all_refs = `git for-each-ref --format '%(refname)'`.each_line.map(&:strip)

    raise NoGitRepo unless $?.success?

    all_refs.select { |ref| ref =~ prefix }.map { |ref| ref.gsub(prefix, '') }
  end
end

def forward_to_normal_git_branch!(argv)
  stdout_or_stderr, _ = Open3.capture2e("git", "branch", *argv)

  $stderr.puts stdout_or_stderr
end

if (ARGV - ["--remote", "-r"]).empty?
  is_remote = ARGV.include?("--remote") || ARGV.include?("-r")

  NumberedGitBranch.new(is_remote ? :remote : :local).perform
else
  forward_to_normal_git_branch!(ARGV)
end
