require 'faker'
require 'open-uri'

puts "Cleaning the DB..."
GroupMember.destroy_all
FriendGroup.destroy_all
OffersCollection.destroy_all
SpecialOffersList.destroy_all
Restaurant.destroy_all
SpecialOffer.destroy_all
User.destroy_all

owner = User.create!(
  username: "Steven",
  email: "Steve@biteoff.com",
  password: "ABC123"
)

owner.photo.attach(io: File.open("app/assets/images/profilepic/steven.jpg"), filename: "steven.jpg", content_type: "image/jpg")

mark = User.create!(
  username: "MarkH",
  email: "Mark@biteoff.com",
  password: "ABC123"
)

mark.photo.attach(io: File.open("app/assets/images/profilepic/mark.jpg"), filename: "mark.jpg", content_type: "image/jpg")

shafiq = User.create!(
  username: "Shafiq",
  email: "Shafiq@biteoff.com",
  password: "ABC123"
)

shafiq.photo.attach(io: File.open("app/assets/images/profilepic/chafique.png"), filename: "chafique.png", content_type: "image/png")


christian = User.create!(
  username: "Christian",
  email: "Christian@biteoff.com",
  password: "ABC123"
)

christian.photo.attach(io: File.open("app/assets/images/profilepic/christian.jpg"), filename: "christian.jpg", content_type: "image/jpg")

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

restaurant_photo = URI.parse("https://upload.wikimedia.org/wikipedia/commons/b/bb/ELSASS_-_Munchhausen_-_RESTAURANT_a_la_ROSE_-_panoramio.jpg").open

10.times do
  restaurant_name = Faker::Restaurant.unique.name
  restaurant = Restaurant.new(
    name: restaurant_name,
    address: "日本, 〒153-0063 東京都目黒区 目黒#{rand(1..3)}丁目#{rand(1..10)}番#{rand(1..3)}号",
    category: CATEGORIES.sample
  )

   restaurant.user = owner
   restaurant.photos.attach(io: restaurant_photo, filename: "restaurant.jpg", content_type: "image/jpg")
   restaurant.save!
end
puts '... created 10 restaurants'


deals = ["Happy hour Deals", "Early Bird Special", "Buy one get one", "20% off", "$10 off"]
puts "Creating 10 Special Offers"
description = ["Great savings", "Unbeatable Prices", "Amazing Offer", "Amazing deal", "Unbeatable Price"]

def random_date(start_date, end_date)
  rand(start_date..end_date)
end


puts 'Creating 10 offers'

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

puts "...created 10 offers"

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
