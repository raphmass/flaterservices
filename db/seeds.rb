# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# seeding database
require 'faker'

puts "Seed start :-)"

User.destroy_all
Task.destroy_all

puts "1. creating users... "
100.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end
puts "... users created!"

puts "2. creating tasks... "
users = User.all
100.times do
  Task.create!(
    action: Task::ACTIONS.sample,
    status: Task::STATUS.sample,
    price: (5..50).to_a.sample,
    user: users.sample
  )
end
puts "... tasks created!"
