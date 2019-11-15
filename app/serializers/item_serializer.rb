class ItemSerializer < ActiveModel::Serializer
  # attributes to be serialized  
  attributes :id, :name, :base_price, :description, :sold, :created_at, :updated_at
  # model association
  has_many :bids
  belongs_to :auction
end
