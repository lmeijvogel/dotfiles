#!/usr/bin/env ruby
def display_not_mounted
  puts Partition.all.select(&:mountable?)
end

def display_mounted
  puts Partition.all.select(&:removable?)
end

class Partition
  def self.all
    @_all ||= begin
                all_mounts = `lsblk --pairs --output type,name,label,fstype,size,mountpoint,tran,pkname`

                all_mounts.each_line.map { |line| Partition.new(line) }
              end
  end

  def initialize(lsblk_line)
    parts = lsblk_line.scan(%r[(\w+)="([^"]+)"])

    @keys_and_values = Hash[parts]
  end

  def partition?
    @keys_and_values["TYPE"] == "part"
  end

  def mountable?
     partition? && !mounted?
  end

  def removable?
    # Disallow unmounting non-usb drives
    partition? && mounted? && usb?
  end

  def usb?
    @keys_and_values["TRAN"] == "usb" || parent&.usb?
  end

  def to_s
    keys_and_format = {
      "NAME" => "%-7s",
      "LABEL" => "%-30s",
      "SIZE" => "(%4s)",
      "MOUNTPOINT" => "%30s",
      "FSTYPE" => "%8s"
    }

    values = @keys_and_values.values_at(*keys_and_format.keys)

    formats = keys_and_format.values

    format(formats.join("\t"), *values)
  end

  def parent
    self.class.all.find { |el| el.name == @keys_and_values["PKNAME"] }
  end

  def name
    @keys_and_values["NAME"]
  end


  private

  def mounted?
    @keys_and_values["MOUNTPOINT"].to_s.strip != ""
  end
end

def usage!
  puts "Usage: #{__FILE__} [--mounted|--not-mounted]"
  exit 1
end

if ARGV.count != 1
  usage!
end

case ARGV[0]
when "--mounted"
  display_mounted
when "--not-mounted"
  display_not_mounted
else
  usage!
end
