# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# Lower Manhattan Grocery CreateStores
# Template: Store.new(name: , address_one: , address_two: , city: , state: , zipcode: , lat: , long: , buys: true, phone: , email: , twitter_handle: , facebook_page: , )

let apiController = Api::V1::GoogleApiController.new




bobsmayo = Producer.create(name: "Bob's Mayo")


bobsmayo.stores.create(name: "Gristedes", address_one: "71 South End Ave", city: "New York", state: "NY", zipcode: 10280, lat: nil, long: nil, buys: true, phone: 2122337770, email: "minesja@gmail.com")

bobsmayo.stores.create(name: "Zeytuna", address_one: "59 Maiden Ln", city: "New York", state: "NY", zipcode: 10038, lat: nil, long: nil, buys: true, phone: 2127422436, email: "minesja@gmail.com")

bobsmayo.stores.create(name: "Jubilee Market Place", address_one: "99 John St", city: "New York", state: "NY", zipcode: 10038, lat: nil, long: nil, buys: true, phone: 2122330808, email: "minesja@gmail.com")

bobsmayo.stores.create(name: "Whole Foods Market - Greenwich", address_one: "270 Greenwich St", city: "New York", state: "NY", zipcode: 10007, lat: nil, long: nil, buys: true, phone: 2123496555, email: "minesja@gmail.com")

bobsmayo.stores.create(name: "Gourmet Garage", address_one: "366 Broadway", city: "New York", state: "NY", zipcode: 10013, lat: nil, long: nil, buys: true, phone: 2125715850, email: "minesja@gmail.com",)

bobsmayo.stores.create(name: "New York Mart", address_one: "128 Mott St", city: "New York", state: "NY", zipcode: 10013, lat: nil, long: nil, buys: true, phone: 2126800178, email: "minesja@gmail.com")

bobsmayo.stores.create(name: "Sun Vin Grocery Store", address_one: "75 Mulberry St", city: "New York", state: "NY", zipcode: 10013, lat: nil, long: nil, buys: true, phone: 2129620382, email: "minesja@gmail.com")



# https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=YOUR_API_KEY




#
