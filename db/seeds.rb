require 'faker'
require 'open-uri'
require 'json'

puts "Cleaning the DB..."
GroupMember.destroy_all
FriendGroup.destroy_all
OffersCollection.destroy_all
SpecialOffersList.destroy_all
Restaurant.destroy_all
SpecialOffer.destroy_all
User.destroy_all

puts "User creation starts..."

owner = User.create!(
  username: "Steven",
  email: "Steve@biteoff.com",
  password: "123123"
)

owner.photo.attach(io: File.open("app/assets/images/profilepic/steven.jpg"), filename: "steven.jpg", content_type: "image/jpg")

mark = User.create!(
  username: "MarkH",
  email: "Mark@biteoff.com",
  password: "123123"
)

mark.photo.attach(io: File.open("app/assets/images/profilepic/mark.jpg"), filename: "mark.jpg", content_type: "image/jpg")

shafiq = User.create!(
  username: "Shafiq",
  email: "Shafiq@biteoff.com",
  password: "123123"
)

shafiq.photo.attach(io: File.open("app/assets/images/profilepic/chafique.png"), filename: "chafique.png", content_type: "image/png")


christian = User.create!(
  username: "Christian",
  email: "Christian@biteoff.com",
  password: "123123"
)

christian.photo.attach(io: File.open("app/assets/images/profilepic/christian.jpg"), filename: "christian.jpg", content_type: "image/jpg")

User.create!(
  username: "TrisBeep",
  email: "tristan@biteoff.com",
  password: "123123"
).photo.attach(io: File.open("app/assets/images/profilepic/Default_pfp.jpg"), filename: "default.jpg", content_type: "image/jpg")

User.create!(
  username: "AdBrunz",
  email: "adam@biteoff.com",
  password: "123123"
).photo.attach(io: File.open("app/assets/images/profilepic/Default_pfp.jpg"), filename: "default.jpg", content_type: "image/jpg")

User.create!(
  username: "RoHadoo",
  email: "roman@biteoff.com",
  password: "123123"
).photo.attach(io: File.open("app/assets/images/profilepic/Default_pfp.jpg"), filename: "default.jpg", content_type: "image/jpg")

User.create!(
  username: "Phlanic",
  email: "phyu@biteoff.com",
  password: "123123"
).photo.attach(io: File.open("app/assets/images/profilepic/Default_pfp.jpg"), filename: "default.jpg", content_type: "image/jpg")

User.create!(
  username: "KamolMasher",
  email: "mason@biteoff.com",
  password: "123123"
).photo.attach(io: File.open("app/assets/images/profilepic/Default_pfp.jpg"), filename: "default.jpg", content_type: "image/jpg")

User.create!(
  username: "WCLiao",
  email: "wei-cheng@biteoff.com",
  password: "123123"
).photo.attach(io: File.open("app/assets/images/profilepic/Default_pfp.jpg"), filename: "default.jpg", content_type: "image/jpg")

User.create!(
  username: "DyMayo",
  email: "dylan@biteoff.com",
  password: "123123"
).photo.attach(io: File.open("app/assets/images/profilepic/Default_pfp.jpg"), filename: "default.jpg", content_type: "image/jpg")

User.create!(
  username: "BartiMiko",
  email: "bartlomiej@biteoff.com",
  password: "123123"
).photo.attach(io: File.open("app/assets/images/profilepic/Default_pfp.jpg"), filename: "default.jpg", content_type: "image/jpg")

User.create!(
  username: "JarMizzy",
  email: "jarod@biteoff.com",
  password: "123123"
).photo.attach(io: File.open("app/assets/images/profilepic/Default_pfp.jpg"), filename: "default.jpg", content_type: "image/jpg")

User.create!(
  username: "LoriMo",
  email: "loris@biteoff.com",
  password: "123123"
).photo.attach(io: File.open("app/assets/images/profilepic/Default_pfp.jpg"), filename: "default.jpg", content_type: "image/jpg")

User.create!(
  username: "ClauOrdz",
  email: "claudia@biteoff.com",
  password: "123123"
).photo.attach(io: File.open("app/assets/images/profilepic/Default_pfp.jpg"), filename: "default.jpg", content_type: "image/jpg")

User.create!(
  username: "PalToby",
  email: "toby@biteoff.com",
  password: "123123"
).photo.attach(io: File.open("app/assets/images/profilepic/Default_pfp.jpg"), filename: "default.jpg", content_type: "image/jpg")

User.create!(
  username: "HenSan",
  email: "henry@biteoff.com",
  password: "123123"
).photo.attach(io: File.open("app/assets/images/profilepic/Default_pfp.jpg"), filename: "default.jpg", content_type: "image/jpg")

User.create!(
  username: "SegArisa",
  email: "arisa@biteoff.com",
  password: "123123"
).photo.attach(io: File.open("app/assets/images/profilepic/Default_pfp.jpg"), filename: "default.jpg", content_type: "image/jpg")

User.create!(
  username: "Denigal",
  email: "denis@biteoff.com",
  password: "123123"
).photo.attach(io: File.open("app/assets/images/profilepic/Default_pfp.jpg"), filename: "default.jpg", content_type: "image/jpg")

User.create!(
  username: "VanWillow",
  email: "will@biteoff.com",
  password: "123123"
).photo.attach(io: File.open("app/assets/images/profilepic/Default_pfp.jpg"), filename: "default.jpg", content_type: "image/jpg")

User.create!(
  username: "Stuaga",
  email: "stuart@biteoff.com",
  password: "123123"
).photo.attach(io: File.open("app/assets/images/profilepic/Default_pfp.jpg"), filename: "default.jpg", content_type: "image/jpg")


puts "Seeded #{User.all.count} users!"

shibuya_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=restaurants+in+Shibuya&fields=name,formatted_address,photo,rating,opening_hours&key=#{ENV['GOOGLE_MAPS_KEY']}"
shinjuku_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=restaurants+in+Shinjuku&fields=name,formatted_address,rating,photos,opening_hours&key=#{ENV['GOOGLE_MAPS_KEY']}"
meguro_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=restaurants+in+Meguro&fields=name,formatted_address,photo,rating,opening_hours&key=#{ENV['GOOGLE_MAPS_KEY']}"
ginza_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=restaurants+in+Ginza&fields=name,formatted_address,photo,rating,opening_hours&key=#{ENV['GOOGLE_MAPS_KEY']}"




puts "Creating restaurants in Shibuya..."

# Restaurant seeds with names, categories, and coordinates (latitude and longitude)
shibuya_restaurants = [
  { name: "Barbacoa Grill Shibuya", category: "Brazilian Steakhouse / BBQ", latitude: 35.6594, longitude: 139.7014 },
  { name: "Gyukatsu Motomura-  SHibuya", category: "Japanese / Beef Restaurant", latitude: 35.6642, longitude: 139.6993 },
  { name: "BALCONE SHIBUYA", category: "Italian / Mediterranean", latitude: 35.6583, longitude: 139.6982 },
  { name: "Mo-Mo-Paradise", category: "Japanese / Shabu-shabu / Hot Pot", latitude: 35.6568, longitude: 139.7011 },
  { name: "We are the farm", category: "Organic / Farm-to-Table", latitude: 35.6612, longitude: 139.7019 },
  { name: "Maguro-to-Shari Shibuya", category: "Japanese / Sushi", latitude: 35.6569, longitude: 139.7012 },
  { name: "KINKA Sushi Bar Shibuya", category: "Japanese / Sushi / Izakaya", latitude: 35.6574, longitude: 139.7014 },
  { name: "Nakayoshi Shibuya Stream", category: "Japanese / Sushi", latitude: 35.6624, longitude: 139.6995 },
  { name: "Tsukishima Monja Kuuya", category: "Japanese / Monjayaki / Okonomiyaki", latitude: 35.6637, longitude: 139.6979 },
  { name: "Hikiniku no Toriko", category: "Japanese / Hamburg Steak", latitude: 35.6607, longitude: 139.7004 },
  { name: "Ichiran Shibuya", category: "Japanese / Ramen", latitude: 35.6582, longitude: 139.7015 },
  { name: "Gyumon Shibuya", category: "Japanese / Yakiniku / Beef", latitude: 35.6605, longitude: 139.7016 },
  { name: "Sushi no Midori Shibuya", category: "Japanese / Sushi", latitude: 35.6604, longitude: 139.7017 },
  { name: "Arossa Shibuya", category: "Italian / Wine Bar", latitude: 35.6619, longitude: 139.6968 },
  { name: "Tenku no Tsuki", category: "Japanese / Fine Dining / Kaiseki", latitude: 35.6581, longitude: 139.7018 },
  { name: "Local Shibuya", category: "International / Fusion", latitude: 35.6628, longitude: 139.6998 },
  { name: "THE LEGIAN TOKYO", category: "International / Fine Dining", latitude: 35.6615, longitude: 139.6989 },
  { name: "Uobei Goulabe", category: "Japanese / Sushi", latitude: 35.6610, longitude: 139.7000 },
  { name: "Kinkume", category: "Japanese / Sushi / Izakaya", latitude: 35.6588, longitude: 139.6990 },
  { name: "Shokudo Ventuno", category: "Italian / Casual Dining", latitude: 35.6611, longitude: 139.6997 }
]

shibuya_restaurants.each do |restaurant|
  Restaurant.create!(name: restaurant[:name],
    category: restaurant[:category],
    latitude: restaurant[:latitude],
    longitude: restaurant[:longitude],
    user: owner)
end
puts "Created #{shibuya_restaurants.count} restaurants in Shibuya"

puts "Creating restaurants in Shinjuku..."

# Restaurant seeds with names, categories, and coordinates (latitude and longitude)
shinjuku_restaurants = [
  { name: "Tempura Tsunahachi", category: "Japanese / Tempura", latitude: 35.6903, longitude: 139.7017 },
  { name: "Shinjuku Kappo NAKAJIMA", category: "Japanese / Kappo (Traditional)", latitude: 35.6909, longitude: 139.7026 },
  { name: "Nabezo Shinjuku", category: "Japanese / Shabu-shabu / Hot Pot", latitude: 35.6901, longitude: 139.7014 },
  { name: "Ichiran Ramen", category: "Japanese / Ramen", latitude: 35.6910, longitude: 139.7011 },
  { name: "Kakekomi Gyoza", category: "Japanese / Gyoza", latitude: 35.6905, longitude: 139.7015 },
  { name: "Barbacoa Shinjuku", category: "Brazilian Steakhouse / BBQ", latitude: 35.6915, longitude: 139.7043 },
  { name: "Momo Paradise Higashi-guchi", category: "Japanese / Shabu-shabu / Hot Pot", latitude: 35.6889, longitude: 139.7024 },
  { name: "Ramen Nagi - Shinjuku", category: "Japanese / Ramen", latitude: 35.6947, longitude: 139.7029 },
  { name: "Katsukura Shinjuku", category: "Japanese / Tonkatsu", latitude: 35.6900, longitude: 139.7020 },
  { name: "Mo-Mo-Paradise Meiji Dori", category: "Japanese / Shabu-shabu / Hot Pot", latitude: 35.6887, longitude: 139.7012 },
  { name: "Ichiran Shinjuku Kabuki-cho", category: "Japanese / Ramen", latitude: 35.6933, longitude: 139.7017 },
  { name: "Sarabeth's LUMINE 2", category: "International / American Brunch", latitude: 35.6904, longitude: 139.7002 },
  { name: "Gyukatsu Motomura - Shinjuku", category: "Japanese / Beef Restaurant", latitude: 35.6908, longitude: 139.6986 },
  { name: "Sanagi Shinjuku", category: "Japanese / Yakiniku", latitude: 35.6936, longitude: 139.7021 },
  { name: "Tsurutontan Shinjuku", category: "Japanese / Udon", latitude: 35.6914, longitude: 139.7019 },
  { name: "Beef Kitchen Stand", category: "Japanese / Beef / Steak", latitude: 35.6950, longitude: 139.7024 },
  { name: "Sushizanmai", category: "Japanese / Sushi", latitude: 35.6913, longitude: 139.7010 },
  { name: "FISH Shinjuku Store", category: "Seafood / Sushi", latitude: 35.6902, longitude: 139.7014 },
  { name: "Shogun Burger Shinjuku", category: "American / Burgers", latitude: 35.6901, longitude: 139.7030 },
  { name: "Nakau - Shinjuku", category: "Japanese / Fast Food (Udon, Donburi)", latitude: 35.6922, longitude: 139.7021 }
]

shinjuku_restaurants.each do |restaurant|
  Restaurant.create!(name: restaurant[:name],
    category: restaurant[:category],
    latitude: restaurant[:latitude],
    longitude: restaurant[:longitude],
    user: owner)
end
puts "Created #{shinjuku_restaurants.count} restaurants in Shinjuku"

puts "Creating restaurants in Meguro..."

# Restaurant seeds with names, categories, and coordinates (latitude and longitude)
meguro_restaurants = [
  { name: "Mokuren Korean", category: "Korean", latitude: 35.6423, longitude: 139.7010 },
  { name: "Covo - Meguro", category: "Japanese / Dining", latitude: 35.6395, longitude: 139.6998 },
  { name: "Bistro Egalite | French restaurant, Meguro", category: "French", latitude: 35.6442, longitude: 139.6963 },
  { name: "Kabi", category: "Japanese / Modern", latitude: 35.6401, longitude: 139.7041 },
  { name: "Kitchen Punch", category: "American / Casual", latitude: 35.6399, longitude: 139.7015 },
  { name: "Meguro Kitchen", category: "International / Fusion", latitude: 35.6417, longitude: 139.7043 },
  { name: "Mark's Tokyo", category: "American / Casual Dining", latitude: 35.6404, longitude: 139.6984 },
  { name: "Trattoria Ciaoro", category: "Italian", latitude: 35.6413, longitude: 139.6989 },
  { name: "Meguro-Nagamoto", category: "Japanese / Traditional", latitude: 35.6443, longitude: 139.6991 },
  { name: "Rigoletto Short Hills", category: "Italian", latitude: 35.6416, longitude: 139.7027 },
  { name: "Hungry Heaven", category: "American / Comfort Food", latitude: 35.6406, longitude: 139.6988 },
  { name: "Restaurant Re:", category: "French / Japanese Fusion", latitude: 35.6410, longitude: 139.7004 },
  { name: "FUKUNOHANA Meguro", category: "Japanese / Kaiseki", latitude: 35.6407, longitude: 139.7031 },
  { name: "WE ARE THE FARM", category: "Organic / Farm-to-Table", latitude: 35.6425, longitude: 139.6994 },
  { name: "Locale", category: "International / Fusion", latitude: 35.6403, longitude: 139.7012 },
  { name: "Tonki", category: "Japanese / Tonkatsu", latitude: 35.6421, longitude: 139.7013 },
  { name: "DOKO DOKO", category: "Japanese / Okinawan", latitude: 35.6392, longitude: 139.6982 },
  { name: "I-rottah", category: "Japanese / Izakaya", latitude: 35.6409, longitude: 139.7018 },
  { name: "New American Grill", category: "American / Grill", latitude: 35.6418, longitude: 139.6985 },
  { name: "Cabe", category: "International / Casual Dining", latitude: 35.6414, longitude: 139.7003 }
]

meguro_restaurants.each do |restaurant|
  Restaurant.create!(name: restaurant[:name],
    category: restaurant[:category],
    latitude: restaurant[:latitude],
    longitude: restaurant[:longitude],
    user: owner)
end
puts "Created #{meguro_restaurants.count} restaurants in Meguro"

puts "Creating restaurants in Ginza..."

# Restaurant seeds with names, categories, and coordinates (latitude and longitude)
ginza_restaurants = [
  { name: "Ginhachidon Ginza", category: "Japanese / Donburi", latitude: 35.6714, longitude: 139.7649 },
  { name: "Ginza Shabugen", category: "Japanese / Shabu-shabu", latitude: 35.6731, longitude: 139.7612 },
  { name: "Ginza Ukai-Tei", category: "Japanese / Teppanyaki", latitude: 35.6710, longitude: 139.7642 },
  { name: "Gyūan Ginza", category: "Japanese / Yakiniku (Beef)", latitude: 35.6735, longitude: 139.7627 },
  { name: "Ginza Kyūbey Honten", category: "Japanese / Sushi", latitude: 35.6733, longitude: 139.7617 },
  { name: "Makiyaki Ginza Onodera", category: "Japanese / BBQ", latitude: 35.6728, longitude: 139.7615 },
  { name: "Tsuru TonTan UDON NOODLE", category: "Japanese / Udon", latitude: 35.6712, longitude: 139.7645 },
  { name: "Ichi-nii-san", category: "Japanese / Sushi", latitude: 35.6721, longitude: 139.7630 },
  { name: "Ginza Kousui", category: "Japanese / Kaiseki", latitude: 35.6717, longitude: 139.7641 },
  { name: "Fujimaru - Ginza", category: "French / Teppanyaki", latitude: 35.6734, longitude: 139.7619 },
  { name: "L'Osier", category: "French / Fine Dining", latitude: 35.6730, longitude: 139.7621 },
  { name: "Shabusen - Ginza", category: "Japanese / Shabu-shabu", latitude: 35.6741, longitude: 139.7610 },
  { name: "bills Ginza", category: "International / Australian Brunch", latitude: 35.6719, longitude: 139.7635 },
  { name: "Ippudo - Ginza", category: "Japanese / Ramen", latitude: 35.6738, longitude: 139.7624 },
  { name: "Ginza Maru", category: "Japanese / Sushi", latitude: 35.6725, longitude: 139.7620 },
  { name: "Dazzle", category: "International / Fusion", latitude: 35.6737, longitude: 139.7615 },
  { name: "Air", category: "International / Fine Dining", latitude: 35.6713, longitude: 139.7639 },
  { name: "Seryna", category: "Japanese / Yakiniku", latitude: 35.6732, longitude: 139.7633 },
  { name: "Nichigekka Ginza", category: "Japanese / Kaiseki", latitude: 35.6729, longitude: 139.7629 },
  { name: "Andhra Dining GINZA", category: "Indian / Andhra Cuisine", latitude: 35.6740, longitude: 139.7613 }
]

ginza_restaurants.each do |restaurant|
  Restaurant.create!(name: restaurant[:name],
    category: restaurant[:category],
    latitude: restaurant[:latitude],
    longitude: restaurant[:longitude],
    user: owner)
end
puts "Created #{ginza_restaurants.count} restaurants in Ginza"

puts "....created #{Restaurant.count} restaurants!"

# # user_serialized = URI.parse(ginza_url).read
# # ginza_json = JSON.parse(user_serialized)

# # ginza_restaurants = ginza_json["results"]
# # ginza_restaurants.each do |restaurant|
# #   puts restaurant["name"]
#   # puts restaurant["geometry"]["location"]["lat"]
#   # puts restaurant["geometry"]["location"]["lng"]
# end


# CATEGORIES = ["burger", "ramen", "sushi", "desserts", "healthy", "kebabs", "pizza", "tacos", "sandwiches"]

# puts "Creating 10 Restaurants..."

# restaurant_photo = URI.parse("https://upload.wikimedia.org/wikipedia/commons/b/bb/ELSASS_-_Munchhausen_-_RESTAURANT_a_la_ROSE_-_panoramio.jpg").open

# 10.times do
#   restaurant_name = Faker::Restaurant.unique.name
#   restaurant = Restaurant.new(
#     name: restaurant_name,
#     address: "日本, 〒153-0063 東京都目黒区 目黒#{rand(1..3)}丁目#{rand(1..10)}番#{rand(1..3)}号",
#     category: CATEGORIES.sample
#   )

#    restaurant.user = owner
#    restaurant.photos.attach(io: restaurant_photo, filename: "restaurant.jpg", content_type: "image/jpg")
#    restaurant.save!
# end
# puts '... created 10 restaurants'


deals = ["Happy hour Deals", "Early Bird Special", "Buy one get one", "20% off", "$10 off"]
puts "Creating 10 Special Offers"
description = ["Great savings", "Unbeatable Prices", "Amazing Offer", "Amazing deal", "Unbeatable Price"]

def random_date(start_date, end_date)
  rand(start_date..end_date)
end


puts 'Creating offers'

  start_date = random_date(Date.new(2024, 12, 1), Date.new(2024, 12, 31))
  end_date = start_date + rand(1..10).days

  restaurants = Restaurant.all
  restaurants.each do |restaurant|
    SpecialOffer.create!(
      category: deals.sample,
      description: description.sample,
      start_date: start_date,
      end_date: end_date,
      restaurant: restaurant,
      user: owner,
      confirmation_count: 0
    )

  end

puts "...created #{SpecialOffer.count} offers"

special_offers = SpecialOffer.all

puts "Creating #{special_offers.count * 3} reviews"

special_offers.each do |offer|
  review = Review.new(
    {
      description: "Amazing deal, saved a lot on my purchase!",
      rating: 5
    }
  )
  review.user = User.all.sample
  review.special_offer = offer
  review.save

  review = Review.new(
    {
      description: "The deal was great and everyone was very helpful. Highly recommend it!",
      rating: 4
    }
  )
  review.user = User.all.sample
  review.special_offer = offer
  review.save

  review = Review.new(
  {
      description: "The offer wasn't available when I visited.",
      rating: 2
  }
  )
  review.user = User.all.sample
  review.special_offer = offer
  review.save
end
puts "...created #{special_offers.count * 3} reviews"

puts "...creating  friend group"
biteoff_grp = FriendGroup.new(name: "BiteOff")

puts "...including friend in the group"
User.all.each do |user|
  member = GroupMember.new
  member.user = user
  member.friend_group = biteoff_grp
  member.save!
end

puts "...creating SpecialOffersList & OffersCollection"
marksparty = SpecialOffersList.create!(name: "Mark s Party")
OffersCollection.create!(special_offer: SpecialOffer.all[0], special_offers_list: marksparty)
OffersCollection.create!(special_offer: SpecialOffer.all[1], special_offers_list: marksparty)
chafsparty = SpecialOffersList.create!(name: "Chaf s Party")
OffersCollection.create!(special_offer: SpecialOffer.all[2], special_offers_list: chafsparty)
OffersCollection.create!(special_offer: SpecialOffer.all[3], special_offers_list: chafsparty)
