# db/seeds.rb

# seed for users"
require 'faker'
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
