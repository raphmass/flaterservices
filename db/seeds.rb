# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# seeding database
require 'faker'

separator = "------------------------------------"

puts separator
puts "Seed starts :-)"

puts separator
puts "0. Destroy existing datas... "
Assignment.destroy_all
Task.destroy_all
User.destroy_all
puts "... Database is empty!"

puts separator
puts "1. Creating users... "
pswd = '123flater'
# Create team accounts
team = [
  {first_name: 'Raphael', last_name: 'Massonneau', email: 'raph@gmail.com', password: pswd, role: 'admin' },
  {first_name: 'Maxime', last_name: 'Forler', email: 'max@gmail.com', password: pswd, role: 'admin' },
  {first_name: 'Pierre', last_name: 'M\'Baga', email: 'pierre@gmail.com', password: pswd, role: 'admin' },
  {first_name: 'Dareth', last_name: 'NHANG', email: 'dareth@gmail.com', password: pswd, role: 'admin' }
]
team.each do |teamate|
  User.create!(teamate)
end
# Create fake accounts
50.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: pswd,
    role: nil
  )
end
puts "... users created!"

puts separator
puts "2. Creating random tasks... "
users = User.first(25)
100.times do
  Task.create!(
    action: Task::ACTIONS.sample,
    status: (0..(Task::STATUS.size - 1)).to_a.sample,
    price: (5..50).to_a.sample,
    user: users.sample
  )
end
puts "... tasks created!"
    
puts separator
puts "3. Creating random assignments... "
tasks = Task.all
tasks.each do |task|
  Assignment.create!(
    task: tasks.sample,
    validated: [true, false].sample,
    user: users.sample
  )
end
puts "... assignements created!"

puts separator
puts "4. Creating realitic tasks and assignements... "

dareth = User.find_by(email: 'dareth@gmail.com')
pierre = User.find_by(email: 'pierre@gmail.com')
max = User.find_by(email: 'max@gmail.com')

dareth.tasks.destroy_all

t1 = Task.create!(
  action: Task::ACTIONS.sample,
  status: 1, # In progress
  price: (5..50).to_a.sample,
  user: dareth
)

t2 = Task.create!(
  action: Task::ACTIONS.sample,
  status: 2, # Done
  price: (5..50).to_a.sample,
  user: dareth
)

t3 = Task.create!(
  action: Task::ACTIONS.sample,
  status: 0, # To do
  price: (5..50).to_a.sample,
  user: dareth
)

t4 = Task.create!(
  action: Task::ACTIONS.sample,
  status: 0, # To do
  price: (5..50).to_a.sample,
  user: dareth
)

t5 = Task.create!(
  action: Task::ACTIONS.sample,
  status: 0, # To do
  price: (5..50).to_a.sample,
  user: dareth
)

Assignment.create!(
  task: t1,
  validated: true,
  user: pierre
)

Assignment.create!(
  task: t1,
  validated: false,
  user: max
)

Assignment.create!(
  task: t2,
  validated: true,
  user: max
)

Assignment.create!(
  task: t3,
  validated: false,
  user: pierre
)

Assignment.create!(
  task: t4,
  validated: false,
  user: max
)

Assignment.create!(
  task: t4,
  validated: false,
  user: dareth
)
puts "... realistic datas created!"

puts separator
puts "Seed is finished ;-)"
puts separator
