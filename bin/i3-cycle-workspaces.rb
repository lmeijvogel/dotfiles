#!/usr/bin/env ruby
require 'json'

def main
  num = next_workspace(ARGV[0])["num"]

  `i3-msg workspace #{num}`
end

def workspaces
  @workspaces ||= begin
    workspaces_json = `i3-msg -t get_workspaces`

    JSON.parse(workspaces_json)
  end
end

def focused_workspace
  workspaces.select { |ws| ws["focused"] }.first
end

def next_workspace(direction)
  workspaces_on_current_output = workspaces.select { |ws| ws["output"] == current_output }
  if direction == "down"
    next_workspace = workspaces_on_current_output.select { |ws| ws["num"] < focused_workspace["num"] }.last
    unless next_workspace
      next_workspace = workspaces_on_current_output.last
    end
  else
    next_workspace = workspaces_on_current_output.select { |ws| ws["num"] > focused_workspace["num"] }.first
    unless next_workspace
      next_workspace = workspaces_on_current_output.first
    end
  end

  next_workspace
end

def current_output
  focused_workspace["output"]
end

main
