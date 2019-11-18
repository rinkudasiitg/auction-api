class Auction < ApplicationRecord
  has_many :items, dependent: :destroy
  belongs_to :admin, :class_name => "User", :foreign_key => 'created_by'

  validates :title, presence: true
  validates :description, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
