class Store < ApplicationRecord
  belongs_to :producer
  has_one :message



end
