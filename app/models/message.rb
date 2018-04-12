class Message < ApplicationRecord
  belongs_to :search
  belongs_to :store
  belongs_to :producer



end
