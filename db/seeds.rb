require 'faker'

Restaurant.delete_all

20.times do
  Restaurant.create(
    name: Faker::Movies::LordOfTheRings.character,
    user_id: 4,
    description: Faker::Restaurant.description,
    address: Faker::Movies::LordOfTheRings.location,
    rating: 5,
    capacity: 99,
    category: Faker::Restaurant.type,
    price_range: "$"
    )
end
