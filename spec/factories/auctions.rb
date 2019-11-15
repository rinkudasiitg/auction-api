FactoryBot.define do
  factory :auction do
    title { Faker::Lorem.word }
    description { Faker::Lorem.paragraph(sentence_count: 2) }
    start_time {  DateTime.now }
    end_time { Faker::Time.forward(days: 15, period: :morning) }
  end
end