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

    @nearStores = []

    Store.all.each do |store|
      storeLat = store.latitude
      storeLong = store.longitude

      distance = Haversine.distance(searchLat, searchLong, storeLat, storeLong).to_miles

      if distance <= radius
        @nearStores.push(store)
      end
    end

    render json: @nearStores, status: 200
  end





  private

  def store_params
    params.require(:stores).permit(:name, :address_one, :address_two, :city, :state, :zipcode, :buys, :phone, :email, :producer_id, :latitude, :longitude, :radius)
  end


end
