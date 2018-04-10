class User < ApplicationRecord
  belongs_to :producer
  has_secure_password



end
