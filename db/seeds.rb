# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

30.times do 
  Project.create(
    name: Faker::Company.catch_phrase,
    description: "#{Faker::Company.bs} from #{Faker::Company.name} #{Faker::Company.suffix}",
    goal: rand(100000),
    start_date: rand(2.days).ago,
    finish_date: rand(10.days).from_now
  )
end