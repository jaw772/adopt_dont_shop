# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdoptablePet.destroy_all

aurora = Shelter.create!(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
lakewood = Shelter.create!(name: 'Lakewood shelter', city: 'Lakewood, CO', foster_program: false, rank: 6)

aurora.pets.create!(adoptable: true, age: 3, breed: 'pug', name: 'Mel')
aurora.pets.create!(adoptable: true, age: 3, breed: 'terrier', name: 'Max')
aurora.pets.create!(adoptable: true, age: 1, breed: 'mixed', name: 'Duke')
aurora.pets.create!(adoptable: true, age: 2, breed: 'rabbit', name: 'Snowball')

lakewood.pets.create!(adoptable: true, age: 3, breed: 'blue russian', name: 'Chloe')
lakewood.pets.create!(adoptable: true, age: 3, breed: 'pomeranian', name: 'Gidget')
lakewood.pets.create!(adoptable: true, age: 1, breed: 'parakeet', name: 'Sweetpea')
lakewood.pets.create!(adoptable: true, age: 2, breed: 'poodle', name: 'Leonard')
