# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all
Category.destroy_all
ActiveRecord::Base.connection.execute(
  'UPDATE SQLITE_SEQUENCE SET seq = 0 WHERE name = \'products\''
)
ActiveRecord::Base.connection.execute(
  'UPDATE SQLITE_SEQUENCE SET seq = 0 WHERE name = \'categories\''
  )
product1 = Product.create(title: 'Ruby book', description: 'Learn Ruby programming', price: 12.99, published: true)
product2 = Product.create(title: 'jQuery Book', description: 'Learn jQuery', price: 11.99, published: true)
product3 = Product.create(title: 'SASS Book', description: 'Learn CSS with SASS', price: 19.99, published: true)
category1 = Category.create(title: 'Programming')
Category.create(title: 'Literature')

Product.create(title: 'Ruby and Rails', description: 'Learn Ruby programming', price: 12.99, published: true, category: category1)

category1.products << [product1, product2, product3]

puts product1.category.title

ap category1.products

products = Product.includes(:category).limit(10)
products.each do |product|
  puts product.title
  puts product.category.title
end
puts "----------------"
