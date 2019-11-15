class Item < ApplicationRecord
  belongs_to :auction
  has_many :bids, dependent: :destroy

  validates :name, presence: true
  validates :base_price, presence: true, numericality: true
  validates :description, presence: true
end
