require 'faker'
require 'open-uri'
require 'json'

puts "Cleaning the DB..."
Invitation.destroy_all
Collection.destroy_all
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

# shibuya_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=restaurants+in+Shibuya&fields=name,formatted_address,photo,rating,opening_hours&key=#{ENV['GOOGLE_MAPS_KEY']}"
# shinjuku_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=restaurants+in+Shinjuku&fields=name,formatted_address,rating,photos,opening_hours&key=#{ENV['GOOGLE_MAPS_KEY']}"
# meguro_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=restaurants+in+Meguro&fields=name,formatted_address,photo,rating,opening_hours&key=#{ENV['GOOGLE_MAPS_KEY']}"
# ginza_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=restaurants+in+Ginza&fields=name,formatted_address,photo,rating,opening_hours&key=#{ENV['GOOGLE_MAPS_KEY']}"

puts "Creating restaurants in Tokyo..."

# Restaurant seeds with names, categories, and coordinates (latitude and longitude)
restaurants = [
  {name: "Ninja Akasaka", category: "Themed Restaurant", latitude: 35.6762, longitude: 139.7404},
  {name: "Kanda Yabu-Soba", category: "Soba Noodles", latitude: 35.6958, longitude: 139.7704},
  {name: "Sushi Kanesaka", category: "Sushi", latitude: 35.6764, longitude: 139.7632},
  {name: "Motenashi-Kuroki", category: "Ramen", latitude: 35.7002, longitude: 139.7706},
  {name: "Nodaiwa", category: "Unagi", latitude: 35.675, longitude: 139.7447},
  {name: "Osteria da-K-Hattori", category: "Italian", latitude: 35.6931, longitude: 139.7532},
  {name: "Kanda Matsuya", category: "Soba Noodles", latitude: 35.6945, longitude: 139.7701},
  {name: "Soranoiro", category: "Ramen", latitude: 35.6784, longitude: 139.7636},
  {name: "Pizzeria E Trattoria Da Isa", category: "Italian", latitude: 35.6983, longitude: 139.7702},
  {name: "Kakiden", category: "Kaiseki", latitude: 35.693, longitude: 139.7042},
  {name: "Sukiyabashi Jiro", category: "Sushi", latitude: 35.6734, longitude: 139.7623},
  {name: "Ginza Kojyu", category: "Kaiseki", latitude: 35.6719, longitude: 139.7642},
  {name: "Tempura Kondo", category: "Tempura", latitude: 35.671, longitude: 139.7642},
  {name: "Sushi Yoshitake2", category: "Sushi", latitude: 35.6718, longitude: 139.764},
  {name: "Tapas Molecular Bar", category: "Molecular Gastronomy", latitude: 35.687, longitude: 139.7741},
  {name: "Ginza Ukai-Tei", category: "Teppanyaki", latitude: 35.671, longitude: 139.7642},
  {name: "Sushi Tokami", category: "Sushi", latitude: 35.6716, longitude: 139.7645},
  {name: "L'Osier", category: "French", latitude: 35.673, longitude: 139.7621},
  {name: "Sushi Saito", category: "Sushi", latitude: 35.6655, longitude: 139.7394},
  {name: "Sazenka", category: "Chinese", latitude: 35.6581, longitude: 139.7394},
  {name: "Narisawa", category: "French", latitude: 35.6645, longitude: 139.7264},
  {name: "Sushi Masuda", category: "Sushi", latitude: 35.6653, longitude: 139.7302},
  {name: "Quintessence", category: "French", latitude: 35.6274, longitude: 139.7385},
  {name: "L'Effervescence", category: "French", latitude: 35.664, longitude: 139.7294},
  {name: "Florilège", category: "French", latitude: 35.6648, longitude: 139.7123},
  {name: "Ishikawa", category: "Kaiseki", latitude: 35.693, longitude: 139.7042},
  {name: "Kagurazaka Ishikawa", category: "Kaiseki", latitude: 35.7023, longitude: 139.7401},
  {name: "Sushi Yoshitake", category: "Sushi", latitude: 35.6718, longitude: 139.764},
  {name: "Narisawa-", category: "French", latitude: 35.6645, longitude: 139.7264},
  {name: "Sushi-Masuda", category: "Sushi", latitude: 35.6653, longitude: 139.7302},
  {name: "Sushi-Saito", category: "Sushi", latitude: 35.6655, longitude: 139.7394},
  {name: "Kagurazaka-Ishikawa", category: "Kaiseki", latitude: 35.7023, longitude: 139.7401},
  {name: "Sushi-Yoshitake", category: "Sushi", latitude: 35.6718, longitude: 139.764},
  {name: "Mensho Tokyo", category: "Ramen", latitude: 35.7074, longitude: 139.7606},
  {name: "Kanda Yabu Soba", category: "Soba Noodles", latitude: 35.6958, longitude: 139.7704},
  {name: "Sushi-Kanesaka", category: "Sushi", latitude: 35.6764, longitude: 139.7632},
  {name: "Motenashi Kuroki", category: "Ramen", latitude: 35.7002, longitude: 139.7706},
  {name: "Osteria da K.Hattori", category: "Italian", latitude: 35.6931, longitude: 139.7532},
  {name: "Kanda-Matsuya", category: "Soba Noodles", latitude: 35.6945, longitude: 139.7701},
  {name: "Pizzeria E Trattoria Da-Isa", category: "Italian", latitude: 35.6983, longitude: 139.7702},
  {name: "Sukiyabashi-Jiro", category: "Sushi", latitude: 35.6734, longitude: 139.7623},
  {name: "Den", category: "Kaiseki", latitude: 35.6938, longitude: 139.753},
  {name: "RyuGin", category: "Kaiseki", latitude: 35.6705, longitude: 139.765},
  {name: "Sazenka4", category: "Chinese", latitude: 35.6581, longitude: 139.7394},
  {name: "Ginza-Kojyu", category: "Kaiseki", latitude: 35.6719, longitude: 139.7642},
  {name: "Asakusa Imahan", category: "Sukiyaki", latitude: 35.7113, longitude: 139.7966},
  {name: "Namiki Yabusoba", category: "Soba Noodles", latitude: 35.7115, longitude: 139.7952},
  {name: "Sometaro", category: "Okonomiyaki", latitude: 35.7102, longitude: 139.7934},
  {name: "Daikokuya Tempura", category: "Tempura", latitude: 35.7114, longitude: 139.7955},
  {name: "Umezono", category: "Japanese Sweets", latitude: 35.7112, longitude: 139.7953},
  {name: "Kamiya Bar", category: "Western-Japanese Fusion", latitude: 35.7106, longitude: 139.7958},
  {name: "Iriya Plus Café", category: "Café", latitude: 35.7201, longitude: 139.7902},
  {name: "Pelican Café", category: "Bakery/Café", latitude: 35.7078, longitude: 139.7923},
  {name: "Yoroiya Ramen", category: "Ramen", latitude: 35.7113, longitude: 139.7957},
  {name: "Asakusa Kagetsudo", category: "Melon Pan Bakery", latitude: 35.7116, longitude: 139.795},
  {name: "Yakiniku Jumbo", category: "Yakiniku", latitude: 35.7081, longitude: 139.8016},
  {name: "Oshiage Yoshikatsu", category: "Tonkatsu", latitude: 35.7075, longitude: 139.8107},
  {name: "Tonkatsu Ichikatsu", category: "Tonkatsu", latitude: 35.7072, longitude: 139.8105},
  {name: "Kushikatsu Tanaka", category: "Kushikatsu", latitude: 35.7079, longitude: 139.8108},
  {name: "Sushi-Tokami", category: "Sushi", latitude: 35.7076, longitude: 139.8106},
  {name: "Ramen Keisuke", category: "Ramen", latitude: 35.7073, longitude: 139.8104},
  {name: "Tempura Hasegawa", category: "Tempura", latitude: 35.707, longitude: 139.8103},
  {name: "Yakitori Omino", category: "Yakitori", latitude: 35.7067, longitude: 139.8102},
  {name: "Unagi Komagata Maekawa", category: "Unagi", latitude: 35.7064, longitude: 139.8101},
  {name: "Monja Kura", category: "Okonomiyaki", latitude: 35.7061, longitude: 139.81},
  {name: "Fukagawa Tsuribune", category: "Seafood", latitude: 35.6735, longitude: 139.8174},
  {name: "Monja Fukutake", category: "Okonomiyaki", latitude: 35.6732, longitude: 139.8172},
  {name: "Kameido Gyoza", category: "Gyoza", latitude: 35.673, longitude: 139.817},
  {name: "Sushi Dai", category: "Sushi", latitude: 35.6728, longitude: 139.8168},
  {name: "Tomioka Hachimangu", category: "Japanese", latitude: 35.6726, longitude: 139.8166},
  {name: "Fukagawa Juku", category: "Japanese", latitude: 35.6724, longitude: 139.8164},
  {name: "Kiyosumi Shirakawa", category: "Café", latitude: 35.6722, longitude: 139.8162},
  {name: "Fukagawa Edo Museum Café", category: "Café", latitude: 35.672, longitude: 139.816},
  {name: "Monja Street", category: "Okonomiyaki", latitude: 35.6718, longitude: 139.8158},
  {name: "Fukagawa Meshi", category: "Japanese", latitude: 35.6716, longitude: 139.8156},
  {name: "Tofuya Ukai", category: "Tofu Kaiseki", latitude: 35.6574, longitude: 139.7454},
  {name: "Ramen Jiro Meguro", category: "Ramen", latitude: 35.6331, longitude: 139.715},
  {name: "Gotetsu", category: "Okonomiyaki", latitude: 35.6091, longitude: 139.7304},
  {name: "Shinagawa Okina", category: "Sushi", latitude: 35.6285, longitude: 139.7389},
  {name: "Tonkatsu Tonki", category: "Tonkatsu", latitude: 35.6312, longitude: 139.716},
  {name: "Kura Sushi", category: "Sushi", latitude: 35.6095, longitude: 139.7306},
  {name: "Yakiniku Champion", category: "Yakiniku", latitude: 35.6093, longitude: 139.7302},
  {name: "Tempura Yamanoue", category: "Tempura", latitude: 35.609, longitude: 139.73},
  {name: "Sushi Taichi", category: "Sushi", latitude: 35.6087, longitude: 139.7298},
  {name: "Tonki", category: "Tonkatsu", latitude: 35.6331, longitude: 139.715},
  {name: "Kura-Sushi", category: "Sushi", latitude: 35.6333, longitude: 139.7152},
  {name: "Yakiniku-Champion", category: "Yakiniku", latitude: 35.6339, longitude: 139.7158},
  {name: "Tempura-Yamanoue", category: "Tempura", latitude: 35.6341, longitude: 139.716},
  {name: "Sushi-Taichi", category: "Sushi", latitude: 35.6343, longitude: 139.7162},
  {name: "T.Y. Harbor", category: "Brewery/International", latitude: 35.6347, longitude: 139.7166},
  {name: "Anagoya", category: "Unagi", latitude: 35.5615, longitude: 139.715},
  {name: "Kamata Horumon", category: "Horumon", latitude: 35.5617, longitude: 139.7152},
  {name: "Ramen Dai Kamata", category: "Ramen", latitude: 35.5619, longitude: 139.7154},
  {name: "Tonkatsu Marugo", category: "Tonkatsu", latitude: 35.5621, longitude: 139.7156},
  {name: "Sushi Zanmai Kamata", category: "Sushi", latitude: 35.5623, longitude: 139.7158},
  {name: "Yakitori Taisho", category: "Yakitori", latitude: 35.5625, longitude: 139.716},
  {name: "Seirinkan", category: "Pizza", latitude: 35.6475, longitude: 139.6697},
  {name: "Yakitori Imai", category: "Yakitori", latitude: 35.6468, longitude: 139.6689},
  {name: "Shimauma", category: "Japanese Fusion", latitude: 35.648, longitude: 139.67},
  {name: "Ramen Jiro Sangenjaya", category: "Ramen", latitude: 35.646, longitude: 139.6675},
  {name: "Pizzeria da Peppe-Napolistaca", category: "Italian", latitude: 35.647, longitude: 139.669},
  {name: "Tempura Motoyoshi", category: "Tempura", latitude: 35.6485, longitude: 139.6705}
]

restaurants.each do |restaurant|
  Restaurant.create!(name: restaurant[:name],
    category: restaurant[:category],
    latitude: restaurant[:latitude],
    longitude: restaurant[:longitude],
    user: owner)
end
puts "Created #{restaurants.count} restaurants in Tokyo"

# Predefined special offers for different categories
special_offers = {
  "Sushi" => {
    category: "Half-Price Sushi Platter Night",
    description: "Enjoy a deluxe sushi platter with 12 expertly crafted pieces for half the price (¥2,500) every Thursday evening, 5 PM to 9 PM."
  },
  "Yakitori" => {
    category: "¥1,000 Yakitori Lunch Set",
    description: "Morning set with coffee, bagel, sausage for ¥1,000."
  },
  "Café" => {
    category: "¥1,000 Morning Set",
    description: "Lunch Set with a bowl of rice, a small cup of chicken broth soup, and a small salad, plus five kinds of yakitori for ¥1,000."
  },
  "Yakiniku" => {
    category: "All-You-Can-Eat Menu from ¥2,980",
    description: "All-you-can-eat menu including A5 Wagyu beef and Sendai Cow tongue starts from 2,980 yen!"
  },
  "Tonkatsu" => {
    category: "Kurobuta Gozen ¥500 Discount Wednesdays",
    description: "You will receive a 500 yen discount on your bill when you order a Kurobuta type product set meal."
  },
  "Japanese Fusion" => {
    category: "All-You-Can-Eat Sushi Rolls for ¥2,900",
    description: "Indulge in unlimited sushi rolls for dinner every Friday night. Reservation required."
  },
  "Japanese Sweets" => {
    category: "Dessert Lovers Matcha Pairing for ¥900",
    description: "Pair our house-made matcha parfait with traditional Japanese sweets after your dinner entrée for only ¥900."
  },
  "Horumon" => {
    category: "All-You-Can-Eat Dinner from 5pm for ¥2,500",
    description: "All-you-can-eat plan from Shimachan that offers great value for money and great customer savings!"
  },
  "Tempura" => {
    category: "Tempura Set Meal for ¥1,800",
    description: "Dive into a crispy tempura set meal featuring prawns, seasonal vegetables, and dipping sauces. Includes tea. Available daily for lunch."
  },
  "Kaiseki" => {
    category: "Weekend Kaiseki Lunch Special at ¥3,000",
    description: "Experience an seasonal delicacies in Japanese traditional kaiseki meal, exclusively on Saturdays and Sundays from 12 PM to 2 PM."
  },
  "Ramen" => {
    category: "Ramen Bowl + Gyoza Combo at ¥1,200",
    description: "Slurp up a hearty ramen bowl with a side of crispy gyoza. Available Monday to Friday from 6 PM until close."
  },
  "Italian" => {
    category: "Tuesday Pasta & Dessert for ¥1,800",
    description: "Choose any pasta entrée and a decadent dessert, plus a free glass of house wine, for only ¥1,800."
  },
  "Pizza" => {
    category: "2-for-1 Pizza Night on Wednesdays",
    description: "Order any large pizza and get a second one free every Wednesday evening."
  },
  "Teppanyaki" => {
    category: "Steak Dinner for Two with Wine for ¥5,800",
    description: "Treat yourself and a loved one to two sirloin steak meals, accompanied by a bottle of house wine, every Friday."
  },
  "Tofu Kaiseki" => {
    category: "Dinner Set Special at ¥2,000",
    description: "Authentic Japanese multi-course kaiseki lunch showcasing seasonal delicacies."
  },
  "Soba Noodles" => {
    category: "Soba & Sake Set for ¥1,200",
    description: "Get a bowl of soba noodles (hot or cold) and a glass of premium sake for ¥1,200. Offer valid on Thursdays only."
  },
  "Unagi" => {
    category: "Grilled Eel Bowl for ¥1,500",
    description: "Savor our signature unagi bowl with rice, pickles, and miso soup, discounted during weekday lunch hours."
  },
  "Okonomiyaki" => {
    category: "DIY Okonomiyaki Night for ¥900",
    description: "Build your perfect savory pancake and enjoy a complimentary dessert. Available Sundays from 5 PM to 9 PM."
  },
  "Chinese" => {
    category: "All-You-Can-Taste Dim Sum",
    description: "Plus a welcome drink (Weekdays Only) - Value of JPY 7,700 → JPY 7,040 (8% off)"
  },
  "Themed Restaurant" => {
    category: "2-for-1 Appetizer Tuesdays",
    description: "Buy one appetizer and get a second one free. Available every Tuesday for lunch and dinner."
  },
  "Brewery/International" => {
    category: "All-American Brunch for ¥1,200",
    description: "Indulge in a brunch platter with pancakes, scrambled eggs, crispy bacon, and coffee. Available Saturday mornings."
  },
  "Kushikatsu" => {
    category: "16th Anniversary All Menu Discount!",
    description: "33 types of Kushi Katsu, normally priced between 130 to 260 yen, for just 110 yen!"
  },
  "French" => {
    category: "Wine & Cheese Pairing for Two at ¥2,800",
    description: "Savor a curated selection of cheeses paired with two glasses of house wine. Perfect for wine lovers."
  }
}

# Iterate through all restaurants and assign matching special offers
restaurants = Restaurant.all
start_date = Date.today
end_date = start_date + 30.days


restaurants.each do |restaurant|
  offer = special_offers[restaurant.category]
  random = Random.new.rand(5..30)
  if offer
    SpecialOffer.create!(
      category: offer[:category],
      description: offer[:description],
      start_date: start_date,
      end_date: end_date,
      restaurant: restaurant,
      user: owner,
      confirmation_count: random
    )
  else
    puts "No special offer found for category: #{restaurant.category}"
  end
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
     description: "The food was fantastic and paired with such a nice deal!",
     rating: 5
   }
  )
  review.user = User.all.sample
  review.special_offer = offer
  review.save
end
puts "...created #{special_offers.count * 3} reviews"
