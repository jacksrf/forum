# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(username: "jacksrf", password: 'password')
User.create(username: "jeff", password: 'password')

Entry.create(title: "Test", content: "this is a test for the page")
Entry.create(title: "Test2", content: "this is a second test for the page")
