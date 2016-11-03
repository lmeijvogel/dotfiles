#!/usr/bin/env ruby

class CreateShellVariables
  def perform
    clear_current_vars

    items_with_indices = add_indices(yield)

    set_vars(items_with_indices)

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
      puts %Q|echo "[#{i}] #{item}"|
    end
  end

  def set_vars(items_with_indices)
    items_with_indices.each do |item, i|
      puts %Q|export e#{i}=#{item}|
    end
  end

  def add_indices(items)
    items.map.with_index { |item, i| [item, i+1] }
  end
end
