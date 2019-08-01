# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
Dog.destroy_all
Dogsitter.destroy_all
Stroll.destroy_all
City.destroy_all

10.times do
  city = City.create!(city_name: Faker::Address.city)
end


20.times do 
  dogsitter = Dogsitter.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city: City.find(rand(City.first.id..City.last.id)))
  dog = Dog.create!(name: Faker::Name.name, race: Faker::Creature::Dog.breed, city: City.find(rand(City.first.id..City.last.id)))
end
30.times do
  stroll = Stroll.create!(date: Faker::Date.forward(days:28), dog: Dog.find(rand(Dog.first.id..Dog.last.id)), dogsitter: Dogsitter.find(rand(Dogsitter.first.id..Dogsitter.last.id)), city: City.find(rand(City.first.id..City.last.id)))
end 
