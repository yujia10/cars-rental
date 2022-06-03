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
require "open-uri"

s_date1 = Date.new(2022,5,5)
e_date1 = Date.new(2022,5,10)

s_date2 = Date.new(2022,6,1)
e_date2 = Date.new(2022,6,2)

s_date3 = Date.new(2022,7,10)
e_date3 = Date.new(2022,7,12)

s_date4 = Date.new(2022,8,3)
e_date4 = Date.new(2022,8,6)

s_date5 = Date.new(2022,9,1)
e_date5 = Date.new(2022,9,11)

s_date6 = Date.new(2022,10,10)
e_date6 = Date.new(2022,10,12)

s_date7 = Date.new(2022,11,11)
e_date7 = Date.new(2022,11,12)

#   Character.create(name: 'Luke', movie: movies.first)
Booking.destroy_all
User.destroy_all

yaron2 = User.create!(email: "yaron.kr@test.com", password: "yaron123")
yujia = User.create!(email: "yujia@test.com", password: "yujia123")
julienC = User.create!(email: "julienC@test.com", password: "julienC")
julienV = User.create!(email: "julienV@test.com", password: "julienV")


# EXAMPLPE HOW TO CREATE 1 CAR - COPY IMAGES AND DETAILS FROM THIS WEBSITE: https://www.drivemycar.com.au/cars/toyota-yaris-ashburton/15631
file = URI.open('https://res.cloudinary.com/yaron3010/image/upload/v1654233260/b5c221b3cc61bb09de69895933dc01f0_zshrth.jpg')

description = "it's the Mutts Cutts van. The body is covered with shag carpet"


car1 = Car.new(make: "Harry's ", model: "Dog van", year: 1970,description: description, price_day: 2, address: "265 Grange Rd, Ormond VIC 3204")


car1.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
car1.user = yujia
car1.save!


file2 = URI.open('https://images.carly.co/16662/16662-front-1-normal.jpg')

description2 = "The Veloster Premium Turbo is fun, easy to use, and the complete package with a side of warm hatch attitude. This top-spec Turbo Premium has 3 driving modes; Eco, Sport, Smart. The leather bound multi-function heated steering wheel and the slick-as-ever multimedia suite is excellent in its operation and connectivity. For a coastal blast, the Premium Veloster can be as fun on the inside as it is to look at, thanks to its huge front windows and panoramic glass roof, you can really open the cabin up for an almost convertible-like feel. Other wow-factor features include the wireless charging bay and LED headlights, which should come in handy on some of Australia’s poorly lit roads. The trim heated and ventilated leather seating position is enhanced by the Veloster’s bucket seats and a panoramic sunroof to go with its over-the-top street appeal."

car2 = Car.new(make: "Hyundai", model: "Veloster Turbo", year: 2019,description: description2, price_day: 59, address: "16 Harcourt St, Hawthorn East VIC 3123")

car2.photo.attach(io: file2, filename: 'nes.png', content_type: 'image/png')
car2.user = yujia
car2.save!

# ***************

file = URI.open('https://images.carly.co/16662/16662-front-1-normal.jpg')

description = "The Veloster Premium Turbo is fun, easy to use, and the complete package with a side of warm hatch attitude."

car4 = Car.new(make: "Hyundai", model: "Veloster Turbo", year: 2019,description: description, price_day: 65, address: "259 middleborough rd, box hill")

car4.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
car4.user = julienC
car4.save!

# **********

file = URI.open('https://static.drivemycar.com.au/UserImages/66714-pending-2021-4.jpg')

description = "This Holden Captiva is a considerably big car to accommodate seven people. Captiva is one of the Australia's favourite family vehicle. From sun roof to electric leather seats, it has all the options of a high end luxury car. All wheel drive - perfect for a long drive with Family and friends. Please note the CD player display screen is not working."

car5 = Car.new(make: "Holden", model: "Captiva", year: 2010,description: description, price_day: 27, address: "256 ferntree gully rd, notting hill")

car5.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
car5.user = julienV
car5.save!

# ********

file = URI.open('https://static.drivemycar.com.au/UserImages/32187-pending-3246-1.jpg')

description = "Versatile 5 seat dual cab ute with canopy. Perfect for family getaways, moving house or tradie work. Legendary Toyota 'unbreakable' Hilux reliability. Low KMs, clean and mechanically in great condition."

car6 = Car.new(make: "Toyota", model: "Hilux", year: 2013,description: description, price_day: 35, address: "685 warrigal rd, chadstone")

car6.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
car6.user = yujia
car6.save!

# **********

file = URI.open('https://static.drivemycar.com.au/UserImages/73648-pending-2765-1.jpeg')

description = "Available immediately, can is in immaculate condition and has been well maintained what you see is what you get will not disappoint contact me directly to inspect prior to rent."

car7 = Car.new(make: "Mercedes", model: "C300", year: 2018,description: description, price_day: 102, address: "259 middleborough rd, box hill")

car7.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
car7.user = julienC
car7.save!


# ********

file = URI.open('https://static.drivemycar.com.au/UserImages/78865-pending-3132-1.jpeg')

description = "My Cruze is perfect for an everyday car. You will love the smooth drive, accompanied with luxury features including heated seating, AUX, GPS, leather interior and more! I will consider bringing the car to you if you are located within 20kms. Enjoy that brand new sports car feel without braking the bank!"

car8 = Car.new(make: "Holden", model: "Cruze", year: 2011,description: description, price_day: 25, address: "256 ferntree gully rd, notting hill")

car8.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
car8.user = julienV
car8.save!

# EXAMPLPE HOW TO CREATE BOOKING
bookin3 = Booking.new(start_date: s_date3, end_date: e_date3)
bookin3.car = car4
bookin3.user = yaron2
bookin3.save!


# ********

bookin4 = Booking.new(start_date: s_date4, end_date: e_date4)
bookin4.car = car5
bookin4.user = yujia
bookin4.save!


# ********

bookin5 = Booking.new(start_date: s_date5, end_date: e_date5)
bookin5.car = car6
bookin5.user = yaron2
bookin5.save!

# **********

bookin6 = Booking.new(start_date: s_date6, end_date: e_date6)
bookin6.car = car7
bookin6.user = julienV
bookin6.save!

# **********


bookin7 = Booking.new(start_date: s_date7, end_date: e_date7)
bookin7.car = car8
bookin7.user = julienC
bookin7.save!
