# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# seeding database



100.times do
  User.create(
    first_name: Faker::Name.first_name
    last_name: Faker::Name.last_name
    email: Faker::Internet.email
  )
end

100.times do
  Task.create(
    action: ['Visit', 'Cleaning', 'Check-in/out'].sample
    status: 'Available'
    price: (5..50).to_a.sample
  )
end



