require 'faker'
User.destroy_all
User.create!(
  username: "Steven",
  email: "Steve123@biteoff.com",
  password: "ABC123"
)

User.create!(
  username: "MarkH",
  email: "Mark123@biteoff.com",
  password: "ABC123"
)

User.create!(
  username: "Shafiq",
  email: "Shafiq123@biteoff.com",
  password: "ABC123"
)

User.create!(
  username: "Christian",
  email: "Christian123@biteoff.com",
  password: "ABC123"
)

10.times do
  User.create!(
    username: Faker::Internet.username(),
    email: Faker::Internet.unique.email,
    password: "ABC123"
  )
end

puts "Seeded 14 users!"



# Seed for reviews:
# db/seeds.rb

# Clear existing records to avoid duplicates during re-seeding
# Review.delete_all
# User.delete_all  # Assuming you also want to seed users if they are referenced in reviews

# 14.times do
#   user = User.create!(
#     # name: Faker::Name.name,
#     email: Faker::Internet.email
#   )

#   14.times do
#     Review.create!(
#       content: Faker::Lorem.sentence(word_count: 14),
#       rating: rand(1..14),
#       user_id: user.id
#     )
#   end
# end

# puts "Seed data created successfully!"

puts "Cleaning the DB..."
Restaurant.destroy_all
SpecialOffer.destroy_all
User.destroy_all
User.create!(
  email: "Steve123@biteoff.com",
  password: "123123"
)

User.create!(
  email: "Mark123@biteoff.com",
  password: "123123"
)

User.create!(
  email: "Shafiq123@biteoff.com",
  password: "123123"
)

User.create!(
  email: "Christian123@biteoff.com",
  password: "123123"
)

10.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: "123123"
  )
end

puts "Seeded 14 users!"

CATEGORIES = ["burger", "ramen", "sushi", "desserts", "healthy", "kebabs", "pizza", "tacos", "sandwiches"]

puts "Creating 10 Restaurants..."
10.times do
  restaurant_name = Faker::Restaurant.unique.name
  p restaurant = Restaurant.new(
    name: restaurant_name,
    address: "日本, 〒153-0063 東京都目黒区 目黒#{rand(1..3)}丁目#{rand(1..10)}番#{rand(1..3)}号",
    category: CATEGORIES.sample
  )

   restaurant.user = owner
   restaurant.save!
end
puts '... created 10 restaurants'


deals = ["Happy hour Deals", "Early Bird Special", "Buy one get one", "20% off", "$10 off"]
puts "Creating 10 Special Offers"
description = ["Great savings", "Unbeatable Prices", "Amazing Offer", "Amazing deal", "Unbeatable Price"]

def random_date(start_date, end_date)
  rand(start_date..end_date)
end

10.times do

  start_date = random_date(Date.new(2024, 12, 1), Date.new(2024, 12, 31))
  end_date = start_date + rand(1..10).days

  restaurants = Restaurant.all
  restaurants.each do |restaurant|
    offer = SpecialOffer.create!(
      category: deals.sample,
      description: description.sample,
      start_date: start_date,
      end_date: end_date,
      restaurant: restaurant,
      user: owner,
      confirmation_count: 0
    )

  end
end

puts "...created 10 offers"
