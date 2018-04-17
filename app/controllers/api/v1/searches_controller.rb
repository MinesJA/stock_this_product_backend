require 'geocoder'
require 'haversine'

class Api::V1::SearchesController < ApplicationController

  def index
    @searches = Search.all

    render json: @searches
  end


  def create

    producer_id = searches_params[:producer_id]
    search_term = searches_params[:search_term]
    radius = searches_params[:radius]
    latitude = searches_params[:latitude]
    longitude = searches_params[:longitude]
    ip = request.remote_ip

    producer = Producer.find(producer_id)
    producers_stores = Store.all.select {|store| store.producer_id == producer.id}
    # Find all producers stores

    @nearWonStores = []
    @nearProspectStores = []

    producers_stores.each do |store|
      distance = Haversine.distance(latitude, longitude, store.latitude, store.longitude).to_miles
      # calculates the distance between a store and the search lat/long

      if distance <= radius
        store["search_hit"] += 1
        store.save
        store.buys ? @nearWonStores.push(store) : @nearProspectStores.push(store)
        # sorts stores in range according to whether or not they currently buy
      end
    end

    numberWon = @nearWonStores.length
    numberProspect = @nearProspectStores.length
    numberWon > 0 ? buys = true : buys = false

    @search = producer.searches.new(search_term: search_term, radius: radius, latitude: latitude, longitude: longitude, buys: buys, ip: ip, num_won: numberWon, num_prospect: numberProspect)

    if numberWon > 0 && @search.save
      render json: {message: "Logged search #{ip}", found_stores: @nearWonStores, buys: true, number_won: numberWon, number_prospect: numberProspect, id: @search.id},  status: 200
    elsif @search.save
      render json: {message: "Logged search #{ip}", found_stores: @nearProspectStores, buys: false, number_won: numberWon, number_prospect: numberProspect, id: @search.id},  status: 200
    else
      render json: {error: "Could not log search #{ip}", found_stores: @nearProspectStores, buys: false, number_won: numberWon, number_prospect: numberProspect, id: @search.id},  status: 200
    end
  end


  private

  def searches_params
    params.require(:searches).permit(:location_data, :search_term, :radius, :producer_id, :latitude, :longitude)
  end

end
