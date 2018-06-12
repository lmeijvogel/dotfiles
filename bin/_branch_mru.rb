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
    checkouts.map do |checkout|
      matches = checkout.message.match(%r{moving from (?:[0-9a-zA-Z_\-/]+) to ([0-9a-zA-Z_\-/]+)})

      matches[1]
    end.uniq
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

ReflogEntry = Struct.new(:sha, :ref, :action, :message)
