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
  bio: "I'm a parent of a child with a big heart, and I'm constantly inspired by their kindness and empathy for others. They're going to change the world someday, I just know it.",
  location: "Reinickendorf",
  avatar: Faker::Avatar.image
)

user2 = User.create!(
  first_name: "Lucy",
  last_name: "Treganna",
  username: "coolmom",
  email: "lucy@gmail.com",
  password: "123456",
  bio: "I'm a mom of a toddler, and I love how my child's curiosity about the world around them makes me see things in a new light. Everything is fascinating to them, and it's contagious.",
  location: "Kreuzberg",
  avatar: Faker::Avatar.image
)

user3 = User.create!(
  first_name: "Caio",
  last_name: "Zimbardi",
  username: "oldpappa",
  email: "caio@gmail.com",
  password: "123456",
  bio: "I'm a parent of a child with a great sense of humor, and I'm constantly laughing thanks to their funny comments and silly antics. Who needs stand-up comedy when you have a kid like mine?",
  location: "Charlottenburg",
  avatar: Faker::Avatar.image
)

user4 = User.create!(
  first_name: "Brodie",
  last_name: "White",
  username: "whitepappa",
  email: "brodie@gmail.com",
  password: "123456",
  bio: "I'm a dad of a toddler, and I love getting down on the floor and playing with my kid. Sure, my knees may hurt afterwards, but it's worth it to see them smile.",
  location: "Charlottenburg",
  avatar: Faker::Avatar.image
)

user5 = User.create!( first_name: "Aria", last_name: "Moon", username: "starrynight", email: "aria@gmail.com", password: "123456", bio: "I'm a mom of two, and I think my kids are the coolest people on the planet. I mean, they inherited my sense of humor, so they must be pretty awesome, right?", location: "Prenzlauer Berg", avatar: Faker::Avatar.image)

user6 = User.create!( first_name: "Max", last_name: "Power", username: "powertothemax", email: "max@gmail.com", password: "123456", bio: "I'm a dad of three, and I love nothing more than hearing my kids' belly laughs. It's like music to my ears.", location: "Friedrichshain", avatar: Faker::Avatar.image)

user7 = User.create!( first_name: "Lena", last_name: "Rose", username: "rosesinbloom", email: "lena@gmail.com", password: "123456", bio: "I'm a mom of a toddler, and I love how their little face lights up when they see me. It's like I'm a rockstar or something.", location: "Neukölln", avatar: Faker::Avatar.image)

user8 = User.create!( first_name: "Oscar", last_name: "Wilde", username: "witandwhimsy", email: "oscar@gmail.com", password: "123456", bio: "I'm a parent of a pre-teen, and I'm constantly amazed by the person my child is becoming. They're smart, kind, and full of potential. I'm just here to cheer them on.", location: "Mitte", avatar: Faker::Avatar.image)

user9 = User.create!( first_name: "Zara", last_name: "Khan", username: "fashionista", email: "zara@gmail.com", password: "123456", bio: "I'm a parent of a creative child, and I'm constantly blown away by their imagination and artistic talent. Maybe I'll have a famous artist in the family someday!", location: "Kreuzberg", avatar: Faker::Avatar.image)

user10 = User.create!( first_name: "Javier", last_name: "Garcia", username: "foodie", email: "javier@gmail.com", password: "123456", bio: "I'm a dad of a sports-loving kid, and I've become an expert at cheering from the sidelines. I may not understand all the rules of the game, but I sure know how to clap and yell.", location: "Schöneberg", avatar: Faker::Avatar.image)

user11 = User.create!( first_name: "Katie", last_name: "Smith", username: "bookworm", email: "katie@gmail.com", password: "123456", bio: "I'm a mom of two teenagers, and I'm grateful every day for the bond we share. We may not always agree on everything, but we're always there for each other. That's what family is all about.", location: "Wedding", avatar: Faker::Avatar.image)

users = [user1, user2, user3, user4, user5, user6, user7, user8, user9, user10, user11]
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

# Playground category

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

fairytale = Place.create!(
  name: "Fairytale Playground",
  category: "spielplatz",
  address: "Drosselbartstraße 30, 12057 Berlin",
  description: "The fairytale themed playground in Berlin-Neukölln is based on the stories by the famous fairytale authors - Brothers Grimm. You will find many characters and symbols of those tales all around the area. Kids can climb around a huge castle which is the center of the playground.",
  published: true,
  age_range: "4-7",
  user: users.sample
)

file = URI.open("https://res.cloudinary.com/doztalggg/image/upload/v1678264776/playground/fairytale_crqwvg.jpg")
fairytale.photos.attach(io: file, filename: "fairytale_crqwvg.jpg", content_type: "image/jpg")
fairytale.save!


jungle = Place.create!(
  name: "Jungle Playground",
  category: "spielplatz",
  address: "Dalandweg 21, 12167 Berlin",
  description: "This big jungle themed playground is located in Bäkepark in Berlin-Steglitz. You can combine the stay at the playground with a nice little walk along Teltowkanal, which is right beside the park.",
  published: true,
  age_range: "7-10",
  user: users.sample
)

file = URI.open("https://res.cloudinary.com/doztalggg/image/upload/v1678265023/playground/jungle_jnz2na.jpg")
jungle.photos.attach(io: file, filename: "jungle_jnz2na.jpg", content_type: "image/jpg")
jungle.save!

pirate = Place.create!(
  name: "Pirate Ship",
  category: "spielplatz",
  address: "Tegeler Weg 97, 10589 Berlin",
  description: "On the sun deck of the pirate ship playground at Tegeler Weg is a table tennis area and from the look-out at the pirate ship small pirates can overlook the playground and take on the next adventure. In order to leave the large, wooden pirate ship, the children balance themselves over the bridge, climb down the climbing net or simply use the slide.",
  published: true,
  age_range: "all",
  user: users.sample
)

file = URI.open("https://res.cloudinary.com/doztalggg/image/upload/v1678265415/playground/pirate_pkwuiw.jpg")
pirate.photos.attach(io: file, filename: "pirate_pkwuiw.jpg", content_type: "image/jpg")
pirate.save!

# museum category

anoah = Place.create!(
  name: "ANOHA",
  category: "museum",
  address: "Fromet-und-Moses-Mendelssohn-Platz, 10969 Berlin",
  description: "ANOHA is much more than a children's museum. Visiting ANOHA is like visiting a story: the story of Noah's Ark. This kind of communication is known as immersion, which basically means diving in.",
  published: true,
  age_range: "all",
  user: users.sample
)

file = URI.open("https://res.cloudinary.com/doztalggg/image/upload/v1678265842/museums/anoha_r2kgzr.jpg")
anoah.photos.attach(io: file, filename: "anoha_r2kgzr.jpg", content_type: "image/jpg")
anoah.save!

technikmuseum = Place.create!(
  name: "Deutsches Technikmuseum",
  category: "museum",
  address: "Trebbiner Str. 9, 10963 Berlin",
  description: "The Deutsches Technikmuseum takes you on a journey through time: visitors will be amazed by historic aircrafts, ships and steam locomotives. With an area of 26,500 square metres, it is one of the biggest technological museums in Europe.",
  published: true,
  age_range: "all",
  user: users.sample
)

file = URI.open("https://res.cloudinary.com/doztalggg/image/upload/v1678266196/museums/technikmuseum_emmovg.jpg")
technikmuseum.photos.attach(io: file, filename: "technikmuseum_emmovg.jpg", content_type: "image/jpg")
technikmuseum.save!

history = Place.create!(
  name: "Natural History",
  category: "museum",
  address: "Invalidenstraße 43, 10115 Berlin",
  description: "Discover the world of dinosaurs with the whole family: the new permanent exhibition 'Dinosaurs! Age of the Giant Lizards' not only shows you Tristan, the original skeleton of the world-famous Tyrannosaurus Rex, which, at 4 metres high and 12 metres long, thrilled more than a million visitors in Berlin years ago.",
  published: true,
  age_range: "all",
  user: users.sample
)

file = URI.open("https://res.cloudinary.com/doztalggg/image/upload/v1678266535/museums/history_zitdpq.jpg")
history.photos.attach(io: file, filename: "history_zitdpq.jpg", content_type: "image/jpg")
history.save!

futurium = Place.create!(
  name: "Futurium",
  category: "museum",
  address: "Alexanderufer 2,  10117 Berlin",
  description: "How do we want to live in the future? The Futurium motivates its guests to explore different future perspectives and possibilities in a playful way: various scenarios, an exhibition, a future laboratory and a forum for dialogue and discussion invite them to develop their own attitude.",
  published: true,
  age_range: "all",
  user: users.sample
)

file = URI.open("https://res.cloudinary.com/doztalggg/image/upload/v1678267038/museums/futurium_nogoxa.jpg")
futurium.photos.attach(io: file, filename: "futurium_nogoxa.jpg", content_type: "image/jpg")
futurium.save!

file = URI.open("https://res.cloudinary.com/doztalggg/image/upload/v1678267038/museums/exhibition1_gwgvsu.jpg")
futurium.photos.attach(io: file, filename: "exhibition1_gwgvsu.jpg", content_type: "image/jpg")
futurium.save!

file = URI.open("https://res.cloudinary.com/doztalggg/image/upload/v1678267038/museums/exhibition2_tqqxij.jpg")
futurium.photos.attach(io: file, filename: "exhibition2_tqqxij.jpg", content_type: "image/jpg")
futurium.save!

file = URI.open("https://res.cloudinary.com/doztalggg/image/upload/v1678267039/museums/exhibition3_spsb00.jpg")
futurium.photos.attach(io: file, filename: "exhibition3_spsb00.jpg", content_type: "image/jpg")
futurium.save!

labyrinth = Place.create!(
  name: "Labyrinth Children's Museum",
  category: "museum",
  address: "Osloer Str. 12, 13359 Berlin",
  description: "In the Berlin Labyrinth Children's Museum you'll enter an interactive world of games and exploration stations. Housed in a former factory building, the museum has created a children's paradise: play areas, craft tables and experiment areas - the choice is huge.",
  published: true,
  age_range: "all",
  user: users.sample
)

file = URI.open("https://res.cloudinary.com/doztalggg/image/upload/v1678267635/museums/labyrinth_bvj2er.jpg")
labyrinth.photos.attach(io: file, filename: "labyrinth_bvj2er.jpg", content_type: "image/jpg")
labyrinth.save!

machmit = Place.create!(
  name: "MACHmit!",
  category: "museum",
  address: "Senefelderstraße 5, 10437 Berlin",
  description: "A church, now a combination of children's museum and indoor playground: At MACHmit! Museum for kids, children can play and learn. Some areas are themed historically such as a printer's workshop and a soap shop.",
  published: true,
  age_range: "all",
  user: users.sample
)

file = URI.open("https://res.cloudinary.com/doztalggg/image/upload/v1678267852/museums/machmit_uboewd.jpg")
machmit.photos.attach(io: file, filename: "machmit_uboewd.jpg", content_type: "image/jpg")
machmit.save!


# kinderkaffe category

schonhausen = Place.create!(
  name: "Schönhausen",
  category: "kindercafe",
  address: "Florastraße 27, 13187 Berlin",
  description: "At Café Schönhausen young parents will find all they need. Next to family-style cakes and home-made food there is a little store for accessoires to make family excursions easier.",
  published: true,
  age_range: "all",
  user: users.sample
)

file = URI.open("https://res.cloudinary.com/doztalggg/image/upload/v1678268483/kindercafe/sch%C3%B6nhausen_rfshqi.jpg")
schonhausen.photos.attach(io: file, filename: "sch%C3%B6nhausen_rfshqi.jpg", content_type: "image/jpg")
schonhausen.save!

milchbart = Place.create!(
  name: "Kindercafé Milchbart",
  category: "kindercafe",
  address: "Paul-Robeson-Straße 6, 10439 Berlin",
  description: "Parents can relax for a couple of hours while the children's eyes light up with the amount of things to do for them. A cornucopia of toys, children chairs and a really nice sandbox provide a lot of entertainment and distraction. The children can play with doll prams, bobby cars, stuffed animals and vehicles and let off steam.",
  published: true,
  age_range: "all",
  user: users.sample
)

file = URI.open("https://res.cloudinary.com/doztalggg/image/upload/v1678268790/kindercafe/milchbart_bad4nn.jpg")
milchbart.photos.attach(io: file, filename: "milchbart_bad4nn.jpg", content_type: "image/jpg")
milchbart.save!

familiencafe = Place.create!(
  name: "Familiencafé Emma und Paul",
  category: "kindercafe",
  address: "Gleditschstraße 47, 10781 Berlin",
  description: "While their parents relax in the cosy café area, the little ones play in a great playroom with other children. The playroom has an elevated level and a slide going directly into a ball pool. There is a special section for babies and infants where they can crawl around, rest on cuddly pillows or play with rattles and wooden toys.",
  published: true,
  age_range: "all",
  user: users.sample
)

file = URI.open("https://res.cloudinary.com/doztalggg/image/upload/v1678269003/kindercafe/familien_pf3euf.jpg")
familiencafe.photos.attach(io: file, filename: "familien_pf3euf.jpg", content_type: "image/jpg")
familiencafe.save!

amitola = Place.create!(
  name: "Amitola",
  category: "kindercafe",
  address: "Krossener Straße 35, 10245 Berlin",
  description: "The Amitola in Friedrichshain is now much more than just a children's café. In addition to breakfast, lunch, coffee and cake, there are also over 200 square metres of children's theatre, shows, seminars and workshops on weekends.",
  published: true,
  age_range: "all",
  user: users.sample
)

file = URI.open("https://res.cloudinary.com/doztalggg/image/upload/v1678269181/kindercafe/amitola_kfm76l.jpg")
amitola.photos.attach(io: file, filename: "amitola_kfm76l.jpg", content_type: "image/jpg")
amitola.save!

wunderland = Place.create!(
  name: "Wunderland",
  category: "kindercafe",
  address: "Düsseldorfer Straße 40, 10707 Berlin",
  description: "The family-friendly Café is situated at the famous shopping street Kudamm. It owns an indoor playground where the kinds can climb, walk slalom or dip into the ball pool. While the kids are playing the parents are able to relax, drink some coffee and chit-chat.",
  published: true,
  age_range: "all",
  user: users.sample
)

file = URI.open("https://res.cloudinary.com/doztalggg/image/upload/v1678269380/kindercafe/wunderland_drsmhb.jpg")
wunderland.photos.attach(io: file, filename: "wunderland_drsmhb.jpg", content_type: "image/jpg")
wunderland.save!


#create some events
puts "creating new events"

event_categories = ["birthday", "picnic", "social", "playdate", "other"]
time = Time.now + rand(5).day + rand(5).hour

20.times do
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

event = Event.create(
  user: User.all.sample,
  place: Place.all.sample,
  start_time: time,
  end_time: time + rand(3).hour,
  category: 'picnic',
  title: "#{Faker::FunnyName.name}'s Picnic!",
  description: Faker::Hipster.sentence * 5,
  public: false
)
puts "added new event named #{event.title}"
