class MessageSerializer < ActiveModel::Serializer
  attributes :id, :store_id, :search_id, :email_subject, :email_body, :customer_email



end
