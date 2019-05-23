# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# seeding database
require 'faker'

separator = "---------------------------"

puts separator
puts "Seed starts :-)"

Assignment.destroy_all
Task.destroy_all
User.destroy_all

puts separator
puts "1. creating users... "
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

address = [
  {street_number: '5', street_name: 'Rue Trarieux', code_post: '69003', city: 'Lyon'},
  {street_number: '18', street_name: 'Rue Franklin', code_post: '69002', city: 'Lyon'},
  {street_number: '58', street_name: 'Rue Pasteur', code_post: '69007', city: 'Lyon'},
  {street_number: '22', street_name: 'Rue Smith', code_post: '69002', city: 'Lyon'},
  {street_number: '32', street_name: 'Avenue Felix Faure', code_post: '69003', city: 'Lyon'},
  {street_number: '8', street_name: 'Rue Rollet', code_post: '69003', city: 'Lyon'},
  {street_number: '52', street_name: 'Rue de Sèze', code_post: '69006', city: 'Lyon'},
  {street_number: '10', street_name: 'Rue Mazenod', code_post: '69003', city: 'Lyon'},
  {street_number: '30', street_name: 'Rue Cuvier', code_post: '69006', city: 'Lyon'},
  {street_number: '72', street_name: 'Boulevard Vivier Merle', code_post: '69003', city: 'Lyon'},
  {street_number: '45', street_name: 'Rue de la république', code_post: '69002', city: 'Lyon'},
  {street_number: '67', street_name: 'Rue du Président Edouard Herriot', code_post: '69003', city: 'Lyon'},
  {street_number: '98', street_name: 'Rue Paul Bert', code_post: '69003', city: 'Lyon'},
  {street_number: '20', street_name: 'Rue des capucins', code_post: '69001', city: 'Lyon'},
  {street_number: '3', street_name: 'Avenue Lacassagne', code_post: '69003', city: 'Lyon'},
  {street_number: '132', street_name: 'Avenue Lacassagne', code_post: '69003', city: 'Lyon'},
  {street_number: '48', street_name: 'Rue Garibaldi ', code_post: '69003', city: 'Lyon'},
  {street_number: '10', street_name: 'Rue de la charité', code_post: '69002', city: 'Lyon'},
  {street_number: '57', street_name: 'Rue de Marseille', code_post: '69007', city: 'Lyon'},
  {street_number: '3', street_name: 'Rue Chevreul', code_post: '69007', city: 'Lyon'},
  {street_number: '12', street_name: 'Rue de la Thibaudière', code_post: '69007', city: 'Lyon'},
  {street_number: '3', street_name: 'Rue Père Chevrier', code_post: '69007', city: 'Lyon'},
  {street_number: '7', street_name: 'Rue du Plat', code_post: '69002', city: 'Lyon'},
  {street_number: '9', street_name: 'Rue de Condé', code_post: '69002', city: 'Lyon'},
  {street_number: '5', street_name: 'Rue Servient', code_post: '69003', city: 'Lyon'},
  {street_number: '65', street_name: 'Rue Bossuet', code_post: '69006', city: 'Lyon'},
  {street_number: '12', street_name: 'Rue de la république', code_post: '69002', city: 'Lyon'},
  {street_number: '45', street_name: 'Rue Trarieux', code_post: '69003', city: 'Lyon'}
]
puts "... users created!"

puts separator
puts "2. creating tasks... "
users = User.first(25)
100.times do
  Task.create!(
    action: Task::ACTIONS.sample,
    status: (0..(Task::STATUS.size - 1)).to_a.sample,
    location: address.sample
    price: (5..50).to_a.sample,
    user: users.sample
  )
end
puts "... tasks created!"

puts separator
puts "3. creating assignments... "
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
puts "Seed is finished ;-)"
puts separator
