# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Vote.destroy_all

end

if Opinion.destroy_all

end

if User.destroy_all
  User.create({name: "test", email: "test@email.com",  password: "password123"})
end
