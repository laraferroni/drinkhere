# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#
# Load the initial geo-coded notification areas.
#

CSV.foreach(Rails.root + 'db/seeds/locations.csv') do |row|
  name = row[0]
  puts "Creating Location: #{name}"
  n= Origins.where(name: name).first_or_create
  n.address = name
  n.save
end