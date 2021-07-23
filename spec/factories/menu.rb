FactoryBot.define do
  factory :menu do
    training_menu { Faker::Lorem.characters(number: 5) }
    user_id { 1 }
  end
end