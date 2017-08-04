#!/usr/bin/env ruby

require 'fileutils'

def possible_source_locations
  locations = $possible_source_locations_for_test || ENV.fetch("SP_SOURCE_LOCATIONS").split(" ")
  raise "No SP_SOURCE_LOCATIONS set!" if locations.empty?

  locations
end

def log(*message)
  STDERR.puts(*message)
end

def test_main
  $possible_source_locations_for_test = %w[sites/mobiel_nl engines/desktop_shop]

  cases = {
    "spec/models/product_spec.rb" => ".|spec/models/product_spec.rb",
    "spec/models/product_spec.rb:in" => ".|spec/models/product_spec.rb",
    "spec/models/product_spec.rb:32:in" => ".|spec/models/product_spec.rb:32",
    "./spec/models/product_spec.rb:32:in" => ".|./spec/models/product_spec.rb:32",
    "a/spec/models/product_spec.rb:32:in" => ".|spec/models/product_spec.rb:32",
    "b/spec/models/product_spec.rb:32:in" => ".|spec/models/product_spec.rb:32",
    "sites/mobiel_nl/spec/features/desktop_shop/visitor_visits_smartphone_page_spec.rb" => "sites/mobiel_nl|spec/features/desktop_shop/visitor_visits_smartphone_page_spec.rb",
    "b/sites/mobiel_nl/spec/features/desktop_shop/visitor_visits_smartphone_page_spec.rb" => "sites/mobiel_nl|spec/features/desktop_shop/visitor_visits_smartphone_page_spec.rb",
    "b/sites/mobiel_nl/spec/features/desktop_shop/visitor_visits_smartphone_page_spec.rb:32" => "sites/mobiel_nl|spec/features/desktop_shop/visitor_visits_smartphone_page_spec.rb:32",
    "sites/mobiel_nl/spec/features/desktop_shop/visitor_visits_smartphone_page_spec.rb:32:in" => "sites/mobiel_nl|spec/features/desktop_shop/visitor_visits_smartphone_page_spec.rb:32",
    "b/sites/mobiel_nl/spec/features/desktop_shop/visitor_visits_smartphone_page_spec.rb:32:in" => "sites/mobiel_nl|spec/features/desktop_shop/visitor_visits_smartphone_page_spec.rb:32",
    "b/spec/integration/models/backoffice/product_spec.rb:32:in" => ".|spec/integration/models/backoffice/product_spec.rb:32",
    "spec/integration/models/backoffice/product_spec.rb:32:in" => ".|spec/integration/models/backoffice/product_spec.rb:32",
    "spec/integration/models/backoffice/product_spec.rb:32" => ".|spec/integration/models/backoffice/product_spec.rb:32",
    "spec/integration/models/backoffice/product_spec.rb" => ".|spec/integration/models/backoffice/product_spec.rb",
    "engines/desktop_shop/spec/features/desktop_shop/visitor_visits_smartphone_page_spec.rb" => "engines/desktop_shop|spec/features/desktop_shop/visitor_visits_smartphone_page_spec.rb",
    "spec/features/desktop_shop/01_smartphone/brand_with_phone_page_spec.rb" => "engines/desktop_shop|spec/features/desktop_shop/01_smartphone/brand_with_phone_page_spec.rb",

    "/home/lmeijvogel/projects/mother/spec/models/product_spec.rb" => ".|/home/lmeijvogel/projects/mother/spec/models/product_spec.rb",
    "/home/something/frontend/engines/desktop_shop/spec/features/desktop_shop/visitor_visits_smartphone_page_spec.rb" => "engines/desktop_shop|spec/features/desktop_shop/visitor_visits_smartphone_page_spec.rb",
    "/home/something/frontend/spec/features/desktop_shop/visitor_visits_smartphone_page_spec.rb" => ".|/home/something/frontend/spec/features/desktop_shop/visitor_visits_smartphone_page_spec.rb",

    ["b/sites/mobiel_nl/spec/features/desktop_shop/stranger_visits_smartphone_page_spec.rb", "b/sites/mobiel_nl/spec/features/desktop_shop/visitor_visits_smartphone_page_spec.rb"] => "sites/mobiel_nl|spec/features/desktop_shop/stranger_visits_smartphone_page_spec.rb spec/features/desktop_shop/visitor_visits_smartphone_page_spec.rb",
  }

  cases.each do |input, expected|
    result = find_path_and_branch(input)

    puts "ERROR! #{input}\n  act: #{result.inspect}\n  exp: #{expected.inspect}" if result != expected
  end
  puts
end

def find_path_and_branch(files)
  result = Array(files).each_with_object({}) do |file, acc|
    raise "Not a spec file: #{file}" unless file =~ /spec/

    file = file.gsub(/:in$/, "")
    file = file.gsub(%r|^[ab]/|, "")

    source_location = possible_source_locations.detect do |possible_source_location|
      file =~ %r|#{possible_source_location}/(.*)|
    end

    if source_location
      base_name = $1
      acc[source_location] ||= []
      acc[source_location] << base_name
    elsif file =~ %r|^(?:\./)?spec/| || file.start_with?('/')
      acc['.'] ||= []
      acc['.'] << file
    else
      log "No location found for #{file}"
      next
    end
  end

  key, values = result.first

  "#{key}|#{values.join(" ")}"
end

def main(file_specifiers)
  puts find_path_and_branch(file_specifiers)
rescue StandardError => e
  log "Error in Ruby"
  log e
  e.backtrace.each do |l| log l ; end
  puts "NOT FOUND"
end

if ARGV[0] == "--test"
  test_main
else
  main(Array(ARGV))
end
