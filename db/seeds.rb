require 'faker'

CATEGORIES = ["chinese", "italian", "japanese", "french", "belgian"]

puts "Cleaning database..."
Restaurant.destroy_all

def create_review(restaurant)
  puts 'Creating Chuck Norris review...'
  review = Review.new(
    content: Faker::ChuckNorris.fact,
    rating: (0..5).to_a.sample.to_i
  )
  review.restaurant = restaurant
  review.save!
  puts "review #{review.id} is created"
end

puts 'Creating 10 fake restaurants...'
10.times do
  restaurant = Restaurant.create!(
    name: Faker::Restaurant.name,
    address:Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: CATEGORIES.sample
  )
  puts "restaurant #{restaurant.id} is created"
  create_review(restaurant)
end
puts 'Finished!'
