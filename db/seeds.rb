# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
City.destroy_all
User.destroy_all
Gossip.destroy_all
PrivateMessage.destroy_all
Tag.destroy_all
GossipTag.destroy_all
Comment.destroy_all

10.times do
  City.create(
    name: Faker::Movies::StarWars.planet, 
    zip_code: Faker::Address.zip_code
    )
end

10.times do 
  User.create(
    first_name: Faker::Movies::StarWars.character.split[0], 
    last_name: Faker::Movies::StarWars.character.split[1], 
    desc: Faker::Quote.yoda,
    email: Faker::Internet.free_email,
    age: Faker::Number.between(from: 16, to: 90),
    city_id: Faker::Number.between(from: 1, to: 10)
    )
end

20.times do 
  Gossip.create(
    title: Faker::Movies::Hobbit.location,
    content:  Faker::Movies::Hobbit.quote,
    user_id: Faker::Number.between(from: 1, to: 10)
    )
end

10.times do 
  Tag.create(title: Faker::TvShows::GameOfThrones.house)
end

20.times do
  GossipTag.create(
    gossip_id: Faker::Number.within(range: 1..10),
    tag_id: Faker::Number.between(from: 1, to: 10)
    )
end

10.times do 
  x = rand(1..9)
  PrivateMessage.create(
    content: Faker::Lorem.question,
    sender_id: x,
    recipient_id: x + 1
    )
end

20.times do
  Comment.create(
    content: Faker::Movies::StarWars.wookiee_sentence,
    gossip_id: Faker::Number.between(from: 32, to: 50), 
    user_id: Faker::Number.between(from: 1, to: 10)
    )
end
