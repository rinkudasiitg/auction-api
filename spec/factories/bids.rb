FactoryBot.define do
    factory :bid do
      bid_amount { Faker::Number.number(digits: 3) }
      item_id nil
    end
  end