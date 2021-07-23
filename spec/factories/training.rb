FactoryBot.define do
  factory :training do
    body_weight { Faker::Lorem.characters(number: 1) }
    body_fat { Faker::Lorem.characters(number: 1) }
    user_id { 1 }
  end
end