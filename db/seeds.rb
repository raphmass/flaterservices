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
addresses = [
  {street_number: '5', street_name: 'Rue Trarieux', zipcode: '69003', city: 'Lyon'},
  {street_number: '18', street_name: 'Rue Franklin', zipcode: '69002', city: 'Lyon'},
  {street_number: '58', street_name: 'Rue Pasteur', zipcode: '69007', city: 'Lyon'},
  {street_number: '22', street_name: 'Rue Smith', zipcode: '69002', city: 'Lyon'},
  {street_number: '32', street_name: 'Avenue Felix Faure', zipcode: '69003', city: 'Lyon'},
  {street_number: '8', street_name: 'Rue Rollet', zipcode: '69003', city: 'Lyon'},
  {street_number: '52', street_name: 'Rue de Sèze', zipcode: '69006', city: 'Lyon'},
  {street_number: '10', street_name: 'Rue Mazenod', zipcode: '69003', city: 'Lyon'},
  {street_number: '30', street_name: 'Rue Cuvier', zipcode: '69006', city: 'Lyon'},
  {street_number: '72', street_name: 'Boulevard Vivier Merle', zipcode: '69003', city: 'Lyon'},
  {street_number: '45', street_name: 'Rue de la république', zipcode: '69002', city: 'Lyon'},
  {street_number: '67', street_name: 'Rue du Président Edouard Herriot', zipcode: '69003', city: 'Lyon'},
  {street_number: '98', street_name: 'Rue Paul Bert', zipcode: '69003', city: 'Lyon'},
  {street_number: '20', street_name: 'Rue des capucins', zipcode: '69001', city: 'Lyon'},
  {street_number: '3', street_name: 'Avenue Lacassagne', zipcode: '69003', city: 'Lyon'},
  {street_number: '132', street_name: 'Avenue Lacassagne', zipcode: '69003', city: 'Lyon'},
  {street_number: '48', street_name: 'Rue Garibaldi ', zipcode: '69003', city: 'Lyon'},
  {street_number: '10', street_name: 'Rue de la charité', zipcode: '69002', city: 'Lyon'},
  {street_number: '57', street_name: 'Rue de Marseille', zipcode: '69007', city: 'Lyon'},
  {street_number: '3', street_name: 'Rue Chevreul', zipcode: '69007', city: 'Lyon'},
  {street_number: '12', street_name: 'Rue de la Thibaudière', zipcode: '69007', city: 'Lyon'},
  {street_number: '3', street_name: 'Rue Père Chevrier', zipcode: '69007', city: 'Lyon'},
  {street_number: '7', street_name: 'Rue du Plat', zipcode: '69002', city: 'Lyon'},
  {street_number: '9', street_name: 'Rue de Condé', zipcode: '69002', city: 'Lyon'},
  {street_number: '5', street_name: 'Rue Servient', zipcode: '69003', city: 'Lyon'},
  {street_number: '65', street_name: 'Rue Bossuet', zipcode: '69006', city: 'Lyon'},
  {street_number: '12', street_name: 'Rue de la république', zipcode: '69002', city: 'Lyon'},
  {street_number: '45', street_name: 'Rue Trarieux', zipcode: '69003', city: 'Lyon'}
]
100.times do
  address = addresses.sample
  Task.create!(
    action: Task::ACTIONS.sample,
    status: (0..(Task::STATUS.size - 1)).to_a.sample,
    location: "#{address[:street_number]} #{address[:street_name]}, #{address[:zipcode]} #{address[:city]}",
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

address = addresses.sample

t1 = Task.create!(
  action: Task::ACTIONS.sample,
  status: 1, # In progress
  price: (5..50).to_a.sample,
  location: "#{address[:street_number]} #{address[:street_name]}, #{address[:zipcode]} #{address[:city]}",
  user: dareth
)

t2 = Task.create!(
  action: Task::ACTIONS.sample,
  status: 2, # Done
  price: (5..50).to_a.sample,
  location: "#{address[:street_number]} #{address[:street_name]}, #{address[:zipcode]} #{address[:city]}",
  user: dareth
)

t3 = Task.create!(
  action: Task::ACTIONS.sample,
  status: 0, # To do
  price: (5..50).to_a.sample,
  location: "#{address[:street_number]} #{address[:street_name]}, #{address[:zipcode]} #{address[:city]}",
  user: dareth
)

t4 = Task.create!(
  action: Task::ACTIONS.sample,
  status: 0, # To do
  price: (5..50).to_a.sample,
  location: "#{address[:street_number]} #{address[:street_name]}, #{address[:zipcode]} #{address[:city]}",
  user: dareth
)

t5 = Task.create!(
  action: Task::ACTIONS.sample,
  status: 0, # To do
  price: (5..50).to_a.sample,
  location: "#{address[:street_number]} #{address[:street_name]}, #{address[:zipcode]} #{address[:city]}",
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
