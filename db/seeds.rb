# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# wipe everything
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
adjectives = ["Pirate", "Castle", "Kingdom", "Wonder", "Bounce"]
categories = ["spielplatz", "kindercafe", "museum"]
ages = ["1-3", "4-7", "7-10", "all"]

# create some places
puts "creating new places"

places = []

12.times do
  random = Faker::Food.unique.fruits
  place = Place.create!(
      name: "#{adjectives.sample.capitalize} #{random} #{categories.sample.capitalize}",
      category: categories.sample,
      address: Faker::Address.full_address,
      description: Faker::Hipster.sentences(number: 4),
      published: true,
      age_range: ages.sample,
      user: users.sample
    )
  place.save
  puts "added new place named #{place.name}"
  places << place
end

# places.sample.id

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
