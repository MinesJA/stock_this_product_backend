require 'geocoder'
require 'haversine'

class Api::V1::StoresController < ApplicationController



  def index
    @stores = Store.all
    render json: @stores
  end

  def show
    @store = Store.find(params[:id])

    render json: @store, status: 200
  end


  def fetchnear
    searchLat = store_params[:latitude]
    searchLong = store_params[:longitude]
    radius = store_params[:radius]

    @nearWonStores = []
    @nearProspectStores = []

    Store.all.each do |store|
      distance = Haversine.distance(searchLat, searchLong, store.latitude, store.longitude).to_miles
      # calculates the distance between a store and the search lat/long

      if distance <= radius
        store.buys ? @nearWonStores.push(store) : @nearProspectStores.push(store)
        # sorts stores in range according to whether or not they currently buy
      end
    end

    @nearWonStores.length > 0 ? (render json: @nearWonStores, status: 200) : (render json: @nearProspectStores, status: 200)
  end





  private

  def store_params
    params.require(:stores).permit(:name, :address_one, :address_two, :city, :state, :zipcode, :buys, :phone, :email, :producer_id, :latitude, :longitude, :radius)
  end


end
