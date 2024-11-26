require 'faker'

puts "Cleaning the DB..."


Restaurant.destroy_all
SpecialOffer.destroy_all
User.destroy_all
owner = User.create!(
  username: "Steven",
  email: "Steve@biteoff.com",
  password: "ABC123"
)

User.create!(
  username: "MarkH",
  email: "Mark@biteoff.com",
  password: "ABC123"
)

User.create!(
  username: "Shafiq",
  email: "Shafiq@biteoff.com",
  password: "ABC123"
)

User.create!(
  username: "Christian",
  email: "Christian@biteoff.com",
  password: "ABC123"
)

# 10.times do
#   User.create!(
#     username: Faker::Internet.username(),
#     email: Faker::Internet.unique.email,
#     password: "ABC123"
#   )
# end

puts "Seeded 14 users!"

CATEGORIES = ["burger", "ramen", "sushi", "desserts", "healthy", "kebabs", "pizza", "tacos", "sandwiches"]

puts "Creating 10 Restaurants..."
10.times do
  restaurant_name = Faker::Restaurant.unique.name
restaurant = Restaurant.new(
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


review = Review.new(
  {
    description: "Amazing deal, saved a lot on my purchase!",
    rating: 5
  }
)
review.user = User.all.sample
review.special_offer = SpecialOffer.all.sample
review.save

review = Review.new(
  {
    description: "The free dessert was delicious. Highly recommend it!",
    rating: 4
  }
)
review.user = User.all.sample
review.special_offer = SpecialOffer.all.sample
review.save

review = Review.new(
{
    description: "The offer wasn't available when I visited.",
    rating: 2
}
)
review.user = User.all.sample
review.special_offer = SpecialOffer.all.sample
review.save

puts "...created 3 reviews"


# review = Review.new({ description: "The pizza was amazing, fresh ingredients and perfect crust!", rating: 5 }); review.user = User.all.sample; review.special_offer = SpecialOffer.all.sample; review.save
# review = Review.new({ description: "The burger was decent, but the fries were soggy.", rating: 3 }); review.user = User.all.sample; review.special_offer = SpecialOffer.all.sample; review.save
# review = Review.new({ description: "Best sushi I've ever had, definitely coming back for more!", rating: 5 }); review.user = User.all.sample; review.special_offer = SpecialOffer.all.sample; review.save
# review = Review.new({ description: "The pasta was bland and overcooked. Not great.", rating: 2 }); review.user = User.all.sample; review.special_offer = SpecialOffer.all.sample; review.save
# review = Review.new({ description: "Great value for the price, the steak was tender and cooked perfectly.", rating: 4 }); review.user = User.all.sample; review.special_offer = SpecialOffer.all.sample; review.save
# review = Review.new({ description: "I loved the dessert, it was a sweet end to the meal!", rating: 5 }); review.user = User.all.sample; review.special_offer = SpecialOffer.all.sample; review.save
# review = Review.new({ description: "Food was cold by the time it arrived, very disappointing.", rating: 2 }); review.user = User.all.sample; review.special_offer = SpecialOffer.all.sample; review.save
# review = Review.new({ description: "The salad was fresh, but the dressing was too tangy for my taste.", rating: 3 }); review.user = User.all.sample; review.special_offer = SpecialOffer.all.sample; review.save
# review = Review.new({ description: "Amazing vegan options, really enjoyed the plant-based dishes!", rating: 5 }); review.user = User.all.sample; review.special_offer = SpecialOffer.all.sample; review.save
# review = Review.new({ description: "The service was slow, but the food made up for it.", rating: 4 }); review.user = User.all.sample; review.special_offer = SpecialOffer.all.sample; review.save
# review = Review.new({ description: "The chicken was dry and lacked flavor. Not what I expected.", rating: 2 }); review.user = User.all.sample; review.special_offer = SpecialOffer.all.sample; review.save
# review = Review.new({ description: "The food was delicious, but the portions were smaller than expected.", rating: 3 }); review.user = User.all.sample; review.special_offer = SpecialOffer.all.sample; review.save
# review = Review.new({ description: "I can't stop thinking about the homemade bread, so good!", rating: 5 }); review.user = User.all.sample; review.special_offer = SpecialOffer.all.sample; review.save
# review = Review.new({ description: "The soup was a bit too salty for my liking.", rating: 2 }); review.user = User.all.sample; review.special_offer = SpecialOffer.all.sample; review.save
# review = Review.new({ description: "The food was outstanding, but the ambiance could use some improvement.", rating: 4 }); review.user = User.all.sample; review.special_offer = SpecialOffer.all.sample; review.save
# review = Review.new({ description: "The breakfast buffet was a great variety, highly recommend.", rating: 5 }); review.user = User.all.sample; review.special_offer = SpecialOffer.all.sample; review.save
# review = Review.new({ description: "It was alright, but I expected more flavor from the curry.", rating: 3 }); review.user = User.all.sample; review.special_offer = SpecialOffer.all.sample; review.save
# review = Review.new({ description: "The ice cream was the perfect treat after the meal, highly satisfied.", rating: 5 }); review.user = User.all.sample; review.special_offer = SpecialOffer.all.sample; review.save
# review = Review.new({ description: "Overall, a great experience but the service could be faster.", rating: 4 }); review.user = User.all.sample; review.special_offer = SpecialOffer.all.sample; review.save
# review = Review.new({ description: "I was hoping for more spice in the dish, it was too mild.", rating: 2 }); review.user = User.all.sample; review.special_offer = SpecialOffer.all.sample; review.save

# puts "...created 20 reviews"
