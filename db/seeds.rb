# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.where(name: "John Lennon", email: "john_lennon@example.com")
  .first_or_create(name: "John Lennon", email: "john_lennon@example.com")
User.where(name: "Janis Joplin", email: "janis_joplin@example.com")
  .first_or_create(name: "Janis Joplin", email: "janis_joplin@example.com")
User.where(name: "Whitney Houston", email: "whitney_houston@example.com")
  .first_or_create(name: "Whitney Houston", email: "whitney_houston@example.com")
User.where(name: "Jimi Hendrix", email: "jimi_hendrix@example.com")
  .first_or_create(name: "Jimi Hendrix", email: "jimi_hendrix@example.com")

Car.where(brand: "Ford", model: "Expedition")
  .first_or_create(brand: "Ford", model: "Expedition")
Car.where(brand: "Chrysler", model: "Jeep Grand Cherokee")
  .first_or_create(brand: "Chrysler", model: "Jeep Grand Cherokee")
Car.where(brand: "Chevrolet", model: "Volt")
  .first_or_create(brand: "Chevrolet", model: "Volt")

Music.where(artist: "Bob Marley",  album: "One Love")
  .first_or_create(artist: "Bob Marley",  album: "One Love")
Music.where(artist: "Pink Floyd",  album: "Dark Side of the Moon")
  .first_or_create(artist: "Pink Floyd",  album: "Dark Side of the Moon")
Music.where(artist: "The Beatles", album: "Yellow Submarine")
  .first_or_create(artist: "The Beatles", album: "Yellow Submarine")
