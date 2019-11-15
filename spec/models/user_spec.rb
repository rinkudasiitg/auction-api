require 'rails_helper'

# Test suite for User model
RSpec.describe User, type: :model do
  # Association test
  # ensure User with role admin has a 1:m relationship with the auction model
  it { should have_many(:auctions) }
  
  # ensure User with role bidder has a 1:m relationship with the auction model
  it { should have_many(:bids) }
  
  # Validation tests
  # ensure name, email and password_digest are present before save
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:phone) }
  it { should validate_presence_of(:role) }
  it { should validate_presence_of(:password_digest) }
end