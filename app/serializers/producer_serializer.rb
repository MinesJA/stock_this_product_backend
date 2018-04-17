class ProducerSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :description

  has_many :products
end
