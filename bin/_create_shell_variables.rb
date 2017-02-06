#!/usr/bin/env ruby

class CreateShellVariables
  attr_reader :start_at

  def initialize(start_at: 1)
    @start_at = start_at
  end

  def perform(lines, translation: ->(line) { line })
    clear_current_vars

    items_with_indices = add_indices(lines)

    set_vars(items_with_indices, translation: translation)

    show_var_prefix
    show_list(items_with_indices)
  end

  private

  def clear_current_vars
    (0..500).each do |i|
      puts "unset e#{i}"
    end
  end

  def show_var_prefix
    puts %Q|echo "    [*] => \\$e*"|
  end

  def show_list(items_with_indices)
    items_with_indices.each do |item, i|
      sanitized_item = item.gsub(/"/, '\"')
      sanitized_item = sanitized_item.gsub(/`/, '\\\\`')
      puts %Q|echo "[#{i}] #{sanitized_item}"|
    end
  end

  def set_vars(items_with_indices, translation:)
    items_with_indices.each do |item, i|
      translated_item = translation.(item)
      puts %Q|export e#{i}=#{translated_item}|
    end
  end

  def add_indices(items)
    items.map.with_index { |item, i| [item, i+start_at] }
  end
end
