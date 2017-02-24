# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# T-Shirts
Product.create(name: "Return of the Jedi Shirt", price: 25.00, description: "Shirt with Return of the Jedi Logo")
Product.create(name: "Darth Vader 1", price: 20.00, description: "Darth Vader shirt with face")
Product.create(name: "Darth Vader 2", price: 28.00, description: "Darth Vader fathers day shirt")
#Accessories
Product.create(name: "Darth Vader Statue", price: 200.00, description: "Life size Darth Vader Statue")
Product.create(name: "Yoda Statue", price: 150.00, description: "Yoda Statue- Three feet tall")
Product.create(name: "Blue Lightsaber", price: 30.00, description: "Rey's lightsaber from Force Awakens")
#Misc.
Product.create(name: "Phasma Mask", price: 20.00, description: "Captain Phasma mask")
Product.create(name: "Phone Case", price: 20.00, description: "Star Wars Force Awakens Phone Case")
Product.create(name: "Backpack", price: 25.00, description: "Backpack with logos")
