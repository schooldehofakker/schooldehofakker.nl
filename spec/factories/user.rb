FactoryBot.define do
  factory :user do
    id { Faker::Number.number }
    admin { false }
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    password { 'qwerty' }
  end

  factory :admin, parent: :user do
    after(:create) do |user, _|
      user.admin = true
      user.save!
    end
  end
end
