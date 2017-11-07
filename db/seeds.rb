# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.destroy_all
User.destroy_all

business_meeting = Category.create(name: "Business Meeting")
friends_meeting = Category.create(name: "Friends Meeting")
birthday_party = Category.create(name: "Birthday Party")
christmas_party = Category.create(name: "Christmas Party")

arno = User.create!(email: 'arno@codaisseur.com', password: '123456')
miriam = User.create(email: "miriam@codaisseurbnb.com", password: "abcd1234")
wouter = User.create(email: "wouter@codaisseurbnb.com", password: "abcd1234")

event1 = Event.create!(
  name: "Meeting",
  description: "A fun meeting.",
  location: "Sarphati Plaza",
  price: 10.0,
  capacity: 15,
  includes_food: false,
  includes_drinks: true,
  starts_at: (011220171200),
  ends_at: (021220171300),
  active: true,
  user: arno
)

event2 = Event.create!(
  name: "Party",
  description: "A birthday party.",
  location: "Party bar",
  price: 2.0,
  capacity: 50,
  includes_food: true,
  includes_drinks: true,
  starts_at: (201220171500),
  ends_at: (211220171600),
  active: true,
  user: miriam
)
