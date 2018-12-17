# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

file = YAML.load_file('db/assets/items.yaml')
file.each do |features|
  Item.create(features)
end

file = YAML.load_file('db/assets/events.yaml')
file.each do |features|
  Event.create(features)
end
