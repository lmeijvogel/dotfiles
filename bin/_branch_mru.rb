require 'set'

class BranchMRU
  BRANCH_NAME_REGEX = "[^\s]+"

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
    checked_out_branches = checkouts.flat_map do |checkout|
      matches = checkout.message.match(%r{moving from (#{BRANCH_NAME_REGEX}) to (#{BRANCH_NAME_REGEX})})

      [matches[2], matches[1]]
    end.uniq

    # Use a Set so I don't have do deduplicate the branches myself
    return Set.new(checked_out_branches) + all_local_branches
  end

  def all_local_branches
    all_refs = `git for-each-ref --format '%(refname)' refs/heads`.each_line.map(&:strip)

    all_refs.map { |branch| branch.gsub(%r[^refs/heads/], "") }
  end

  def checkouts
    logs = `git reflog`.split("\n")

    reflog_entries = logs.map do |line|
      match = line.match(%r{
                           ([0-9a-f]+)   # SHA
                           \s+
                           ([^:]+):      # HEAD@
                           \s+
                           ([^:]+)       # action
                           (?::\s+(.*))? # optional message
                         }x)

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

ReflogEntry = Struct.new(:sha, :ref, :action, :message)
