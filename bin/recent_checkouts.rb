#!/usr/bin/env ruby

require 'date'

DAYS = %w[sunday monday tuesday wednesday thursday friday saturday]

LINE_REGEX = %r[([0-9a-f]+) HEAD@{([^}]+)}: checkout: moving from [a-zA-Z0-9_\-\/\.]+ to ([a-zA-Z0-9_\-\/\.]+)]

def main
  checkouts = get_checkouts

  branch_width = checkouts.map { |checkout| checkout.branch.length }.max

  # Reverse first and second entry since we'll never want to switch to the current branch
  checkouts = checkouts.values_at(1, 0) + checkouts[2..-1] if checkouts.length > 1

  puts checkouts.map { |checkout| checkout.to_displayable(branch_width) }
end

def get_checkouts
  @checkouts ||= begin
                   `git reflog show --date=iso --grep-reflog="checkout: moving"`
                     .each_line
                     .map { |line| Checkout.new(line) }
                     .uniq(&:branch)
                 end
end

class Checkout
  attr_reader :date, :branch

  def initialize(line)
    matches = line.match(LINE_REGEX)

    @date = DateTime.parse(matches[2])
    @branch = matches[3]
  end

  def to_displayable(branch_width)
    format("%-#{branch_width}s (%s)", @branch, format_date(@date))
  end

  private

  def format_date(date)
    now = DateTime.now
    two_hours_ago = now - (2.0 / 24)
    yesterday = now - 1
    last_6_days = now - 6

    if two_hours_ago < date
      minutes_ago(date)
    elsif yesterday < date
      format("yesterday %02d:%02d", date.hour, date.minute)
    elsif last_6_days < date
      format("last %s %02d:%02d", DAYS[date.wday], date.hour, date.minute)
    else
      format("%04d-%02d-%02d", date.year, date.month, date.day)
    end
  end

  def minutes_ago(date)
    minutes_f = (DateTime.now - date) * 60 * 24

    minutes = minutes_f.to_i

    if (minutes == 1)
      "#{minutes} minute ago"
    else
      "#{minutes} minutes ago"
    end
  end
end

main
