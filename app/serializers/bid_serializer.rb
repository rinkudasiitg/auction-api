class BidSerializer < ActiveModel::Serializer
  # attributes to be serialized  
  attributes :id, :bid_amount, :created_at, :updated_at
  # model association
  belongs_to :item
  belongs_to :bidder
end
