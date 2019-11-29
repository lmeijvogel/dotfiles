#!/usr/bin/env ruby
require 'json'

def main(up_or_down)
  `i3-msg workspace "#{next_workspace(up_or_down)}"`
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

def focused_workspace_name
  focused_workspace["name"]
end

def workspaces_on_current_output
  workspaces
    .select { |ws| ws["output"] == current_output }
    .reject { |ws| should_skip?(ws) }
    .map { |ws| ws["name"] }
end

def should_skip?(workspace)
  workspace_contains_virtualbox?(workspace["name"])
end

def next_workspace(direction)
  next_workspaces = next_workspaces(direction)

  current_index = next_workspaces.index(focused_workspace_name)

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

def workspace_contains_virtualbox?(workspace_name)
  workspace = find_workspace_in_tree(workspace_name)

  recursive(workspace) do |node|
    return true if node["name"]&.include? "[Running]"
  end

  false
end

def find_workspace_in_tree(name)
  recursive(tree) do |node|
    return node if node["name"] == name
  end

  nil
end

def recursive(node, depth = 0, ancestors = [], &block)
  yield node, depth, ancestors

  node['nodes'].each do |child_node|
    recursive(child_node, depth + 2, ancestors + [node], &block)
  end
end

def tree
  @tree ||= JSON.parse(`i3-msg -t get_tree`)
end

if ARGV.length != 1
  puts "Please only pass 'up' or 'down' as argument"
  exit 1
end

main(ARGV[0])
