class Producer < ApplicationRecord
  has_many :stores
  has_many :users
  has_many :searches
  has_many :messages



end
