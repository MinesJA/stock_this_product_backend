require 'csv'

class Api::V1::CsvsController < ApplicationController

  def create
    filepath = csv_params[:fileName]
    storesArray = readCSVDoc(filepath)
    jerry = Producer.create(name: "Jerry's Pickles")

    storesArray.each do |store|

      updatedStore = updateLongLat(store)
      # {"name"=>"Gristedes", "address_one"=>"71 South End Ave", "address_two"=>nil, "city"=>"New York", "state"=>"NY", "zipcode"=>"10280", "phone"=>"2122337770", "email"=>"minesja@gmail.com", "lat"=>40.7084778, "long"=>-74.0176848}

      jerry.stores.create!(updatedStore)
    end
  end


  private

  def readCSVDoc(file)
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
  end

  def csv_params
    params.require(:csvs).permit(:fileName)
  end

end
