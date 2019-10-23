# coding: utf-8
require 'yaml'

def main
  status_file = ARGV[0] || "#{ENV['HOME']}/backup/.backup_status"

  status_file = YAML.safe_load(File.read(status_file), [Time])

  if outdated?(status_file["date"])
    print(" backup-test-outdated", :pending)

    exit
  end
  
  results = %w[energy_download borg_status b2_status].each_with_object({}) do |field, result|
    result[field] = status_file[field]
  end

  if results.values.include? nil
    if results.values.include? "error"
      print("", :error)
    else
      print("", :pending)
    end
  elsif results.values.uniq == ["ok"]
    print("", :ok)
  else
    print("", :error)
  end

  exit
end

def print(text, status)
  fg_color = case status
             when :ok
               fg_color_ok
             when :error
               fg_color_error
             when :running
               fg_color_running
             end

  puts "%{F#{fg_color} B#{bg_color}}#{text}%{F- B-}";
end

def outdated?(timestamp)
  two_days_ago = Time.now - (60*60*48)

  timestamp < two_days_ago
end
  
def fg_color_ok
  @fg_color_ok ||= `polybar --dump=monitoring-green base`.strip
end

def fg_color_running
  @fg_color_running ||= `polybar --dump=monitoring-grey base`.strip
end

def fg_color_error
  @fg_color_error ||= `polybar --dump=monitoring-red base`.strip
end

def bg_color
  @bg_color ||= `polybar --dump=background base`.strip
end

def print_usage
  puts <<~USAGE
    Usage: #{$0} [status_file]

    Where status_file defaults to $HOME/backup/.backup_status
  USAGE
end 

main
