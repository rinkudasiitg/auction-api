class AuctionSerializer < ActiveModel::Serializer
  # attributes to be serialized  
  attributes :id, :title, :created_by, :description, :start_time, :end_time, :created_at, :updated_at
  # model association
  has_many :items
end
