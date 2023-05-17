# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [
  {name: 'Becca', birthdate: '10/20/1989', city: 'Brooklyn', state: 'NY', email: 'burntout@gmail.com'},
  {name: 'Darcy', birthdate: '12/4/1989', city: 'St. Louis', state: 'MO', email: 'dink@gmail.com'},
]

users.each { |u| binding.pry; User.find_or_create_by(u) }
