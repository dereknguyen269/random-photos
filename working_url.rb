require 'net/http'
require 'rubygems'
require 'open-uri'

def working_url?(url_str)
  url = URI.parse(url_str)
  Net::HTTP.start(url.host, url.port) do |http|
    http.head(url.request_uri).code == '200'
  end
rescue
  false
end
