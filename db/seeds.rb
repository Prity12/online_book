# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create_with(full_name:"Admin", role:1, password:"12345678", password_confirmation:"12345678").find_or_create_by(email:"admin@gmail.com")
Category.find_or_create_by(name: 'Motivational')
Category.find_or_create_by(name: "Business")
Author.find_or_create_by(author_name:'Vex King')
Book.create_with(description:"Be positive and live good life").find_or_create_by(author_id:1, book_name:"Good Vibes, Good Life", category_id:1)
Author.find_or_create_by(author_name:'Rhonda Byrne')
Book.create_with(description:"make you clear about how the law of attraction work").find_or_create_by(author_id:2, book_name:"The Secret", category_id:1)
Author.find_or_create_by(author_name:'Napoleon Hill')
Book.create_with(description:"self improvement book made for business magnete").find_or_create_by(author_id:3, book_name:"Think and grow rich", category_id:2)
