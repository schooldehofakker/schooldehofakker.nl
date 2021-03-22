FactoryBot.define do
  factory :mailing do
    id { Faker::Number.number }
    description { Faker::Lorem.words(number: rand(2..10)) }
    mailing_send { [true, false].sample }
    published_at { Time.zone.now }
    send_at { [Time.zone.now, nil].sample }
    sender { Faker::Number.number }
    slug { Faker::Lorem.words(number: 1) }
    title { Faker::Lorem.words(number: 1) }
  end
end
