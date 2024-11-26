# db/seeds.rb

# seed for users"
require 'faker'
User.destroy_all
User.create!(
  email: "Steve123@biteoff.com",
  password: "ABC123"
)

User.create!(
  email: "Mark123@biteoff.com",
  password: "ABC123"
)

User.create!(
  email: "Shafiq123@biteoff.com",
  password: "ABC123"
)

User.create!(
  email: "Christian123@biteoff.com",
  password: "ABC123"
)

10.times do
  User.create!(
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
