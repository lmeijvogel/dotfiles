#!/usr/bin/env ruby

require 'json'

def main(direction)
  if focused_window_is_floating?
    new_workspace = find_visible_workspace_in_direction(direction)

    `i3-msg workspace "#{new_workspace["name"]}"`
  else
    `i3-msg focus #{direction}`
  end
end

def focused_window_is_floating?
  workspace = find_workspace_in_tree(focused_workspace_name)

  recursive(workspace) do |node|
    return true if node["floating"] == "user_on" && node["focused"]
  end

  false
end

def focused_workspace_name
  focused_workspace["name"]
end

def focused_workspace
  workspaces.find { |ws| ws["focused"] }
end

def find_visible_workspace_in_direction(direction)
  visible_workspaces = workspaces.select { |ws| ws["visible"] }

  focused_workspace_rect = focused_workspace["rect"]

  result = case direction
  when "left"
    visible_workspaces
      .sort_by { |ws| ws["rect"]["x"] }
      .reverse
      .find { |ws| ws["rect"]["x"] < focused_workspace_rect["x"] }
  when "right"
    visible_workspaces
      .sort_by { |ws| ws["rect"]["x"] }
      .find { |ws| ws["rect"]["x"] > focused_workspace_rect["x"] }
  else
    focused_workspace
  end

  result || focused_workspace
end

def workspaces
  @workspaces ||= JSON.parse(`i3-msg -t get_workspaces`)
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
  node['floating_nodes'].each do |child_node|
    recursive(child_node, depth + 2, ancestors + [node], &block)
  end
end

def tree
  @tree ||= JSON.parse(`i3-msg -t get_tree`)
end

if ARGV.length != 1
  puts "Please only pass a direction as argument"
  exit 1
end

main(ARGV[0])
