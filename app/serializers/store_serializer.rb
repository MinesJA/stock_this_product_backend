class StoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :address_one, :address_two, :city, :state, :zipcode, :latitude, :longitude, :buys, :phone, :email, :twitter_handle, :facebook_page, :producer_id, :created_at
end
