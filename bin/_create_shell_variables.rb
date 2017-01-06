#!/usr/bin/env ruby

class CreateShellVariables
  def perform(items, translation: :itself.to_proc)
    clear_current_vars

    items_with_indices = add_indices(items)

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
      sanitized_item = item.gsub(/(["`])/, "\\") # I would have liked to substitute for a backslashed version, but I'm not smart enough

      puts %Q|echo "[#{i}] #{sanitized_item}"|
    end
  end

  def set_vars(items_with_indices, translation:)
    items_with_indices.each do |item, i|
      translated_value = translation.call(item)

      puts %Q|export e#{i}="#{translated_value}"|
    end
  end

  def add_indices(items)
    items.map.with_index { |item, i| [item, i+1] }
  end
end
