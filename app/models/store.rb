class Store < ApplicationRecord
  belongs_to :producer
  has_many :messages



end
