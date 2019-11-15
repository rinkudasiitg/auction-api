require 'rails_helper'

RSpec.describe Auction, type: :model do
  # Association test
  # ensure Auction model has a 1:m relationship with the Item model
  it { should have_many(:items).dependent(:destroy) }
  # Validation tests
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:start_time) }
  it { should validate_presence_of(:end_time) }
end
