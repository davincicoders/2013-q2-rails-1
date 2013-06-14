require 'bcrypt'
CarShareMember.create(first_name: "Jen", username: "Jen", password_digest: BCrypt::Password.create("cleodog"))








# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
