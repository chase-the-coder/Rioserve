require 'json'
require 'open-uri'

url = 'https://developers.zomato.com/api/v2.1/search?entity_id=73&entity_type=city&apikey=a4f1d85868c5fa3598a0e5580a1a2215'
restaurant_api = open(url).read
api = JSON.parse(restaurant_api)
restaurants = api["restaurants"]

puts "Deleting restaurants"
Restaurant.delete_all
puts "Deleted all restaurants"
puts "Creating restaurants"
restaurants.count.times do |counter|
  Restaurant.create(
    user_id: 1,
    name: restaurants[counter]["restaurant"]["name"],
    description: Faker::Restaurant.description,
    address: restaurants[counter]["restaurant"]["location"]["address"],
    rating: restaurants[counter]["restaurant"]["user_rating"]["aggregate_rating"].to_f,
    capacity: rand(100..200),
    category: restaurants[counter]["restaurant"]["cuisines"],
    price_range: restaurants[counter]["restaurant"]["price_range"].to_i,
    latitude: restaurants[counter]["restaurant"]["location"]["latitude"].to_f,
    longitude: restaurants[counter]["restaurant"]["location"]["longitude"].to_f,
    image: restaurants[counter]["restaurant"]["photos"][0]["photo"]["url"],
    cost_for_two: restaurants[counter]["restaurant"]["average_cost_for_two"].to_i,
    phone_number: restaurants[counter]["restaurant"]["phone_numbers"],
    menu: restaurants[counter]["restaurant"]["menu_url"]
    )
end
puts "Created new restaurants"
