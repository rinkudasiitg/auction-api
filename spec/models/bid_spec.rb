require 'rails_helper'

RSpec.describe Bid, type: :model do
  # Association test
  # ensure an Bid record belongs to a single item record
  it { should belong_to(:item) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:bid_amount) }
end
