# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# wipe everything
require "json"
require "rest-client"
require 'open-uri'


puts "destroying all event..."
Event.destroy_all
puts "destroying all places..."
Place.destroy_all
puts "destroying all users..."
User.destroy_all

user1 = User.create!(
  first_name: "Deanna",
  last_name: "Wright",
  username: "kommaqueen",
  email: "deanna@gmail.com",
  password: "123456",
  bio: "I am super super cool and like kids." * 6,
  location: "Reinickendorf",
  avatar: Faker::Avatar.image
)

user2 = User.create!(
  first_name: "Lucy",
  last_name: "Treganna",
  username: "coolmom",
  email: "lucy@gmail.com",
  password: "123456",
  bio: "I am a super super cool mom and like kids." * 6,
  location: "Kreuzberg",
  avatar: Faker::Avatar.image
)

user3 = User.create!(
  first_name: "Caio",
  last_name: "Zimbardi",
  username: "oldpappa",
  email: "caio@gmail.com",
  password: "123456",
  bio: "I am a super super cool old dad and like kids." * 6,
  location: "Charlottenburg",
  avatar: Faker::Avatar.image
)

users = [user1, user2, user3]
# adjectives = ["Pirate", "Castle", "Kingdom", "Wonder", "Bounce"]
# categories = ["spielplatz", "kindercafe", "museum"]
# ages = ["1-3", "4-7", "7-10", "all"]
# # address = ["Weinbergsweg 20, 10119 Berlin",
# #   "Weinbergsweg 14, 10119 Berlin",
# #   "Invalidenstraße 20, 10115 Berlin",
# #   "Caroline-Michaelis-Straße 8, 10115 Berlin",
# #   "Kollwitzstraße 35, 10405 Berlin"
# #   ]

# create some places
puts "creating new places"

# places = []

# 5.times do
#   random = Faker::Food.unique.fruits
#   place = Place.create!(
#       name: "#{adjectives.sample.capitalize} #{random} #{categories.sample.capitalize}",
#       category: categories.sample,
#       address: address.pop,
#       description: Faker::Lorem.paragraph,
#       published: true,
#       age_range: ages.sample,
#       user: users.sample
#     )

#   place.save
#   puts "added new place named #{place.name}"
#   places << place
# end

# places.sample.id


weinbergpark = Place.create!(
  name: "Weinbergpark playground",
  category: "spielplatz",
  address: "Weinbergsweg 14, 10119 Berlin",
  description: "Great playground on top of Weinbergpark, with trampolines, rope pyramid and ping-pong, soccer and basketball court.",
  published: true,
  age_range: "all",
  user: users.sample
)

file = URI.open("https://res.cloudinary.com/doztalggg/image/upload/v1678186980/playground/weinberg_q48nb9.jpg")
weinbergpark.photos.attach(io: file, filename: "weinberg_q48nb9.jpg", content_type: "image/jpg")
weinbergpark.save!

watertower = Place.create!(
  name: "Watertower playground",
  category: "spielplatz",
  address: "Weinbergsweg 20, 10119 Berlin",
  description: "Big playground at the foot of this water tower. One highlight are the 2 big trampolines. And you can also climb the little hill to get sunshine and a view.",
  published: true,
  age_range: "all",
  user: users.sample
)

file = URI.open("https://res.cloudinary.com/doztalggg/image/upload/v1678186993/playground/watertower_zy5gdq.jpg")
watertower.photos.attach(io: file, filename: "watertower_zy5gdq.jpg", content_type: "image/jpg")
watertower.save!

#create some events
puts "creating new events"

event_categories = ["birthday", "picnic", "social", "playdate", "other"]
time = Time.now + rand(5).day + rand(5).hour

5.times do
  category = event_categories.sample
  event = Event.create(
    user: User.all.sample,
    place: Place.all.sample,
    start_time: time,
    end_time: time + rand(3).hour,
    category: category,
    title: "#{Faker::FunnyName.name}'s #{category.capitalize}",
    description: Faker::Hipster.sentence * 5,
    public: true
  )
  puts "added new event named #{event.title}"
end
