# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
require 'date'

s_date1 = Date.new(2022,5,5)
e_date1 = Date.new(2022,5,10)

s_date2 = Date.new(2022,6,1)
e_date2 = Date.new(2022,6,2)

#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

yaron2 = User.create!(email: "yaron.kr@test.com", password: "yaron123")
yujia = User.create!(email: "yujia@test.com", password: "yujia123")
# julienC = User.create!(email: "julienC@test.com", password: "julienC")
# julienV = User.create!(email: "julienV@test.com", password: "julienV")


car3 = Car.new(make: "Mitsubishi", model: "2022", price_day: 175, address: "16 Villa Gaudelet, Paris", url: "https://cdn.vroomvroomvroom.com.au/images/vroomvroomvroom-com-au/cms/wagon.jpg")

car3.user = yaron2
car3.save!

car2 = Car.new(make: "Golf", model: "2020", price_day: 75, url:)
car2.user = yujia
car2.save!

Booking.destroy_all

bookin1 = Booking.new(start_date: s_date1, end_date: e_date1, total_price: 250)
bookin1.car = car2
bookin1.user = yaron2
bookin1.save!


bookin2 = Booking.new(start_date: s_date2, end_date: e_date2, total_price: 150)
bookin2.car = car3
bookin2.user = yujia
bookin2.save!
