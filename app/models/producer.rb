class Producer < ApplicationRecord
  has_many :users
  has_many :stores
  has_many :searches
  has_many :products




end
