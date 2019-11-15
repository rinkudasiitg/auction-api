class User < ApplicationRecord
  has_secure_password

  has_many :auctions, foreign_key: :created_by

  has_many :bids, foreign_key: :bidder_id

  validates_presence_of :name, :email, :phone, :password_digest

  validates :role, presence: true, inclusion: { in: %w{admin bidder} }

  def role?(name)
    role == name.to_s
  end
end
