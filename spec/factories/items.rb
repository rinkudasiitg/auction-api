FactoryBot.define do
  factory :item do
    name { Faker::Lorem.word }
    description { Faker::Lorem.paragraph(sentence_count: 2) }
    base_price { Faker::Number.number(digits: 3) }
    sold false
    auction_id nil
  end
end