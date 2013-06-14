require 'bcrypt'

Car.create(color: 'red', model: 'VW Golf')
Car.create(color: 'black', model: 'VW Jetta', car_share_member_id: 2)
Car.create(color: 'white', model: 'Toyota Celica')

CarShareMember.create(first_name: 'Jen', username: 'Jen', password_digest: BCrypt::Password.create("Jen"))
CarShareMember.create(first_name: 'Ted', username: 'Ted', password_digest: BCrypt::Password.create("Ted"))