require 'faker'

CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]

puts "Cleaning database..."
Restaurant.destroy_all

puts 'Creating 10 fake restaurants...'
10.times do
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    address:Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: CATEGORIES.sample
  )
  puts "restaurant #{restaurant.id} is created"
end
puts 'Finished!'

def create review
  review = Review.create!(
    content: Faker::ChuckNorris.fact,
    rating: (0..5).to_s.sample.to_i
  )
  review.restaurant = restaurant
end