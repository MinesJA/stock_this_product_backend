require 'csv'

class Api::V1::CsvsController < ApplicationController

  def create
    # producer = Producer.create(name: "Jerry's Pickles")
    producer = Producer.find(csv_params[:producer_id])
    filepath = csv_params[:fileName]
    buys = csv_params[:buys]

    if buys
      storesArray = readCSVDoc(filepath, true)

      storesArray.each do |store|
        updatedStore = updateLongLat(store)
        producer.stores.create!(updatedStore)
      end
    else
      storesArray = readCSVDoc(filepath, false)

      storesArray.each do |store|
        updatedStore = updateLongLat(store)
        producer.stores.create!(updatedStore)
      end
    end


  end


  private

  def readCSVDoc(file, buys)
    array = []

    CSV.foreach(file) do |row|
      if !(row[0] === "name")
        object = {}

        object["name"] = row[0]
        object["address_one"] = row[1]
        object["address_two"] = row[2]
        object["city"] = row[3]
        object["state"] = row[4]
        object["zipcode"] = row[5]
        object["phone"] = row[6].to_i
        object["email"] = row[7]
        object["buys"] = buys

        array.push(object)
      end
    end
    array
    # returns array of objects, each object has initial store attributes
  end

  def updateLongLat(object)
    googleApiContr = Api::V1::GoogleApiController.new

    addressString = createAddressString(object["address_one"], object["city"], object["state"])

    json = googleApiContr.fetchGoogleGeo(addressString)
    latitude = json["results"][0]["geometry"]["location"]["lat"]
    longitude = json["results"][0]["geometry"]["location"]["lng"]

    object["latitude"] = latitude
    object["longitude"] = longitude

    object
    # returns object updated with lat and long attributes
  end

  def createAddressString(address, city, state)
    address = address.tr(" ", "+")
    city = city.tr(" ", "+")

    addressString = "#{address},+#{city},+#{state}"
    "https://maps.googleapis.com/maps/api/geocode/json?address=#{addressString}&key=#{ENV["google_geo_key"]}"
    # returns string for google maps api
  end

  def csv_params
    params.require(:csvs).permit(:fileName, :buys, :producer_id)
  end

end
