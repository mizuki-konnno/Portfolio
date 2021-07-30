FactoryBot.define do
  factory :training_content do
    set { Faker::Lorem.characters(number: 1) }
    weight { Faker::Lorem.characters(number: 1) }
    rep { Faker::Lorem.characters(number: 1) }
    user_id { 1 }
    menu_id { 1 }
  end
end
