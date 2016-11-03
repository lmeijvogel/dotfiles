#!/usr/bin/env ruby

require 'open3'

class NumberedGitBranch
  def initialize(local_or_remote)
    @local_or_remote = local_or_remote
  end

  def perform
    clear_current_vars

    show_var_prefix

    show_branches_list

    set_branches_vars
  end

  def clear_current_vars
    (0..500).each do |i|
      puts "unset e#{i}"
    end
  end

  def show_var_prefix
    puts %Q|echo "    [*] => \\$e*"|
  end

  def show_branches_list
    branches_with_indices.each do |br, i|
      puts %Q|echo "[#{i}] #{br}"|
    end
  end

  def set_branches_vars
    branches_with_indices.each do |br, i|
      puts %Q|export e#{i}=#{br}|
    end
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

    all_refs.select { |ref| ref =~ prefix }.map { |ref| ref.gsub(prefix, '') }
  end

  def branches_with_indices
    branches.map.with_index { |branch, i| [branch, i+1] }
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
