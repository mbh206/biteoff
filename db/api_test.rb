require 'open-uri'
require 'json'

shinjuku_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=restaurants+in+Shinjuku&fields=name,formatted_address,rating,photos,opening_hours&key=#{ENV['GOOGLE_MAPS_KEY']}"
shibuya_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=restaurants+in+Shibuya&fields=name,formatted_address,photo,rating,opening_hours&key=#{ENV['GOOGLE_MAPS_KEY']}"
meguro_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=restaurants+in+Meguro&fields=name,formatted_address,photo,rating,opening_hours&key=#{ENV['GOOGLE_MAPS_KEY']}"
ginza_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=restaurants+in+Ginza&fields=name,formatted_address,photo,rating,opening_hours&key=#{ENV['GOOGLE_MAPS_KEY']}"


user_serialized = URI.parse(shibuya_url).read
puts user_serialized
shibuya_restaurants = JSON.parse(user_serialized)
puts shibuya_restaurants
