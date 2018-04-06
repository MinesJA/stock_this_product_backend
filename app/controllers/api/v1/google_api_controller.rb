require 'rest-client'
require 'JSON'


class Api::V1::GoogleApiController < ApplicationController

  # need to have a fuction in here that takes in address info, hits the google geocode API
  # then returns lat long info
  # can call that when I do a post with new addresses and grab the info I need to create
  # new store instances

  def fetchGoogleGeo(addressString)
    info = RestClient.get(addressString)
    JSON.parse(info)
  end




end
