# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Room.find_or_create_by(name: "Room 1", description:"The room # 1", status:0)
Room.find_or_create_by(name: "Room 2", description:"The room # 2", status:0)
Room.find_or_create_by(name: "Room 3", description:"The room # 3", status:0)
Room.find_or_create_by(name: "Room 4", description:"The room # 4", status:0)
