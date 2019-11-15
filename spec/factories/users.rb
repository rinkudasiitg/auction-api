FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email 'foo@bar.com'
    password 'foobar'
    phone { Faker::PhoneNumber.phone_number }
    role "admin"
    #role ["admin", "bidder"].sample
  end
end