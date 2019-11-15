class Auction < ApplicationRecord
  has_many :items, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
