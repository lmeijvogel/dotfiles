#!/usr/bin/env ruby
require 'json'

def main(up_or_down)
  return if workspaces_on_current_output.one?

  num = next_workspace(up_or_down)

  `i3-msg workspace #{num}`
end

def workspaces
  @workspaces ||= begin
    workspaces_json = `i3-msg -t get_workspaces`

    JSON.parse(workspaces_json)
  end
end

def focused_workspace
  workspaces.find { |ws| ws["focused"] }
end

def focused_workspace_num
  focused_workspace["num"]
end

def workspaces_on_current_output
  workspaces.select { |ws| ws["output"] == current_output }.map { |ws| ws["num"] }
end

def next_workspace(direction)
  next_workspaces = next_workspaces(direction)

  current_index = next_workspaces.index(focused_workspace_num)

  # A #cycle feels a bit more robust than current + 1 % length
  next_workspaces.cycle(2).to_a[current_index + 1]
end

def next_workspaces(direction)
  if direction == "down"
    workspaces_on_current_output.reverse
  else
    workspaces_on_current_output
  end
end

def current_output
  focused_workspace["output"]
end

if ARGV.length != 1
  puts "Please only pass 'up' or 'down' as argument"
  exit 1
end

main(ARGV[0])
