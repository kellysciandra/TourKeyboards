# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.find(1)

artist1 = Artist.find_or_create_by(name: "Kelly Sciandra")
keyboard1 = user.keyboards.new(make: "Korg", model: "SV-1 73 Key", price: 1250)
keyboard1.artist = artist1
keyboard1.save

artist2 = Artist.find_or_create_by(name: "Anon")
keyboard2 = user.keyboards.new(make: "Nord", model: "Electro 88 key", price: 2500)
keyboard2.artist = artist2
keyboard2.save

