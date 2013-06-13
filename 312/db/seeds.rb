# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Car.create(color: "red", model: "VW Golf", car_share_member_id: nil)
Car.create(color: "black", model: "VW Jetta", car_share_member_id: 2)
Car.create(color: "white", model: "Toyota Celica", car_share_member_id: nil)

CarShareMember.create(first_name: "Jen", username: "Jen", password_digest: "$2a$10$a4wQUbztQI9QIjgKaSBFcOiW.qVyTAD4aybmlRbXlgd9E3er5I/6.")
CarShareMember.create(first_name: "Ted", username: "Ted", password_digest: "$2a$10$awwXyeevdXJdmxU6zzrFCOJwB/AZJkszAHx2EgmxXGgx8UDX1Y0T2")
