Photo.destroy_all
Category.destroy_all
Event.destroy_all
Profile.destroy_all
User.destroy_all

arno = User.create!(email: 'arno@codaisseur.com', password: '123456')
miriam = User.create(email: "miriam@codaisseurbnb.com", password: "abcd1234")
wouter = User.create(email: "wouter@codaisseurbnb.com", password: "abcd1234")

puts "#{User.all.size} users created"

event1 = Event.create!(
  name: "Meeting",
  description: "A fun meeting.",
  location: "Sarphati Plaza",
  price: 10.0,
  capacity: 15,
  includes_food: false,
  includes_drinks: true,
  starts_at: DateTime.new(2017,12,01,12,00,00),
  ends_at: DateTime.new(2017,12,02,13,00,00),
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
  starts_at: DateTime.new(2017,12,20,15,00,00),
  ends_at: DateTime.new(2017,12,21,16,00,00),
  active: true,
  user: miriam
)

puts "#{Event.all.size} events created"

business = Category.create(name: "Business")
friends = Category.create(name: "Friends")
birthday = Category.create(name: "Birthday")
christmas = Category.create(name: "Christmas")
casual = Category.create(name: "Casual")
formal = Category.create(name: "Formal")

event1.categories = [business, casual]
event2.categories = [friends, birthday, casual]

puts "#{Category.all.size} categories created"

photo1 = Photo.create!(remote_image_url: "http://res.cloudinary.com/teateearu/image/upload/v1510230523/the_office_season_1_cast_odyiic.jpg", event: event1)
photo2 = Photo.create!(remote_image_url: "http://res.cloudinary.com/teateearu/image/upload/v1510226619/what-you-didn-t-miss-in-the-meeting-1105922-TwoByOne_lbk8qo.jpg", event: event1)

photo3 = Photo.create!(remote_image_url: "http://res.cloudinary.com/teateearu/image/upload/v1510227107/0_oQWf4dfKfJVuKFPC._nt4knc.png", event: event2)
photo4 = Photo.create!(remote_image_url: "http://res.cloudinary.com/teateearu/image/upload/v1510226733/c104c63a748530d5e52b514fc10eeaa2-11_aexiyt.jpg", event: event2)

puts "#{Photo.all.size} photos created"
