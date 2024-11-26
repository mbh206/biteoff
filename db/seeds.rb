# db/seeds.rb

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
    password: Faker::Internet.password(min_length: 8)
  )
end

puts "Seeded 14 users!"
