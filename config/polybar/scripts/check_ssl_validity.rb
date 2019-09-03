#!/usr/bin/env ruby
require "date"
require "openssl"
require "socket"

SITES = %w[maybird.nl www.maybird.nl verlichting.maybird.nl energie.maybird.nl rss-reader.maybird.nl].freeze
EXPIRATION_WARNING_THRESHOLD = 30

def main
  expiration_times = SITES.map { |site| get_expiration_period(site) }

  expiring_sites = SITES.zip(expiration_times).select do |site, expiration_time|
    expiration_time < EXPIRATION_WARNING_THRESHOLD
  end

  exit 0 unless expiring_sites.any?

  show_warning(expiring_sites)
  exit 1
end

def show_warning(expiring_sites)
  puts "The following sites will expire:"

  expiring_sites.each do |site, expiration_period|
    puts format("%-30s: %3d days", site, expiration_period)
  end
end

def get_expiration_period(site)
  certificate = get_certificate(site)

  expiration_date = certificate.not_after

  time_span_in_days = (expiration_date.to_datetime - DateTime.now)

  time_span_in_days
end

def get_certificate(site, host = site)
  return TCPSocket.open(host, 443) do |tcp_client|
    with_ssl_socket(tcp_client, site) do |ssl_client|
      OpenSSL::X509::Certificate.new(ssl_client.peer_cert)
    end
  end
end

def with_ssl_socket(tcp_client, site)
  ssl_client = OpenSSL::SSL::SSLSocket.new(tcp_client)
  ssl_client.hostname = site
  ssl_client.connect

  yield ssl_client
ensure
  ssl_client.sysclose
end

main
