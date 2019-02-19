# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create(title: 'Ruby book', description: 'Learn Ruby programming', price: 12.99, published: true)
Product.create(title: 'jQuery Book', description: 'Learn jQuery', price: 11.99, published: true)
Product.create(title: 'SASS Book', description: 'Learn CSS with SASS', price: 19.99, published: true)
