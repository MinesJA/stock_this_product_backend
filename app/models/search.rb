class Search < ApplicationRecord
  has_one :message
  belongs_to :producer

end
