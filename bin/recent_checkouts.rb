#!/usr/bin/env ruby

# TODO:
# - Use in actual scripts
require 'date'

DAYS = %w[sunday monday tuesday wednesday thursday friday saturday]

LINE_REGEX = %r[([0-9a-f]+) HEAD@{([^}]+)}: checkout: moving from [a-zA-Z0-9_\-]+ to ([a-zA-Z0-9_\-]+)]
def main
  puts checkouts
end

def checkouts
  @checkouts ||= begin
                   `git reflog show --date=iso --grep-reflog="checkout: moving"`
                     .each_line
                     .take(400)
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

  def to_s
    format("%-40s (%s)", @branch, format_date(@date))
  end

  private

  def format_date(date)
    now = DateTime.now
    two_hours_ago = now - (2.0 / 24)
    yesterday = DateTime.new(now.year, now.month, now.day - 1)
    last_6_days = DateTime.new(now.year, now.month, now.day - 6)

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
