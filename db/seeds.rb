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

#   Character.create(name: 'Luke', movie: movies.first)
Booking.destroy_all
User.destroy_all

yaron2 = User.create!(email: "yaron.kr@test.com", password: "yaron123")
yujia = User.create!(email: "yujia@test.com", password: "yujia123")
julienC = User.create!(email: "julienC@test.com", password: "julienC")
julienV = User.create!(email: "julienV@test.com", password: "julienV")


# EXAMPLPE HOW TO CREATE 1 CAR - COPY IMAGES AND DETAILS FROM THIS WEBSITE: https://www.drivemycar.com.au/cars/toyota-yaris-ashburton/15631
file = URI.open('https://images.carly.co/15631/15631-front-1-normal.jpg')

description = "My Yaris is great for comfort, speed and economical for driving. It has taken me on very long drives, using only $50 of petrol. To fill the tank, it costs around $40-46. In addition, there is bluetooth for GPS, phone calls and great music. The sound system is epic. In addition, the back seat is comfortable and spacious. The front is as well. Air conditioning works perfectly so does the heater."

car1 = Car.new(make: "Toyota Yaris ", model: "Yaris YR", year: 2014,description: description, price_day: 175, address: "265 Grange Rd, Ormond VIC 3204")

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

# EXAMPLPE HOW TO CREATE BOOKING
# bookin2 = Booking.new(start_date: s_date2, end_date: e_date2)
# bookin2.car = car3
# bookin2.user = yujia
# bookin2.save!
