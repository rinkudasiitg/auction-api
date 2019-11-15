class Bid < ApplicationRecord
  belongs_to :item
  belongs_to :bidder, :class_name => "User", :foreign_key => 'bidder_id'

  validates :bid_amount, presence: true #, numericality: {greater_than: :auction_current}
end
