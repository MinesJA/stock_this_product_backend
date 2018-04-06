require 'rest-client'
require 'JSON'


class Api::V1::GoogleApiController < ApplicationController

  # need to have a fuction in here that takes in address info, hits the google geocode API
  # then returns lat long info
  # can call that when I do a post with new addresses and grab the info I need to create
  # new store instances

  Google.geo_key

  def create_address_string(store)
    address = store.address.tr(" ", "+")
    city = store.address.tr(" ", "+")

    "#{address},+#{city},+#{store.state}"
  end

  def fetch_google(store)
    info = RestClient.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{create_address_string(store)}&key=#{Google.geo_key}")
    JSON.parse(info)
    binding.pry
  end






  # 1600+Amphitheatre+Parkway,+Mountain+View,+CA
  #
  # t.string "name"
  # t.string "address_one"
  # t.string "address_two"
  # t.string "city"
  # t.string "state"
  # t.integer "zipcode"
  # t.integer "lat"
  # t.integer "long"
  # t.boolean "buys"
  # t.integer "phone"
  # t.string "email"
  # t.string "twitter_handle"
  # t.string "facebook_page"
  # t.datetime "created_at", null: false
  # t.datetime "updated_at", null: false
  # t.integer "producer_id"



end
