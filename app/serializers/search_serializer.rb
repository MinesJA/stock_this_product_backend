class SearchSerializer < ActiveModel::Serializer
  attributes :id, :ip, :location_data, :search_term, :radius, :producer_id, :created_at, :latitude, :longitude, :buys, :num_won, :num_prospect

  has_one :message





end
