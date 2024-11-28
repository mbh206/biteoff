require 'uri'
require 'net/http'
require 'json'

@toSend = {
    "textQuery" => "Restaurants in Meguro",
    "X-Goog-FieldMask" => "places.displayName"
}.to_json

uri = URI("https://places.googleapis.com/v1/places:searchText?key=")
https = Net::HTTP.new(uri.host, uri.port)
https.use_ssl = true
req = Net::HTTP::Post.new(uri, initheader = {'Content-Type' =>'application/json'})
req.body = "[ #{@toSend} ]"
res = https.request(req)
puts "Response #{res.code} #{res.message}: #{res.body}"
