require 'geocoder'
require 'haversine'

class Api::V1::StoresController < ApplicationController


  def index

    producer_id = params[:id]
    producer = Producer.find(producer_id)
    producers_stores = Store.all.select {|store| store.producer_id == producer.id}

    @wonStores = producers_stores.select {|store| store.buys }
    @prospectStores = producers_stores.select {|store| !store.buys }

    render json: {wonStores: @wonStores, prospectStores: @prospectStores}
  end


  def show
    @store = Store.find(params[:id])

    render json: @store
  end



  private

  def store_params
    params.require(:stores).permit(:name, :address_one, :address_two, :city, :state, :zipcode, :buys, :phone, :email, :producer_id, :latitude, :longitude, :radius)
  end


end
