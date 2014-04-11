# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Create Plans!
  Plan.create(name: 'Free', cost: 0)
  Plan.create(name: 'Small', cost: 30)
  Plan.create(name: 'Medium', cost: 50)
  Plan.create(name: 'Large', cost: 100)
