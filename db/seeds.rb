# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

require 'faker'

10.times do
  User.create!(
    email: Faker::Internet.unique.email,
    encrypted_password: Faker::Internet.password(min_length: 8),
    reset_password_token: nil,
    reset_password_sent_at: nil,
    remember_created_at: nil,
    created_at: Time.now,
    updated_at: Time.now
  )
end

puts "Seeded 10 users!"
