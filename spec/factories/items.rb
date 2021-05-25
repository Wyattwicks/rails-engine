FactoryBot.define do
  factory :item, class: Item do
    name { Faker::Beer.name}
    description { Faker::Lorem.sentence}
    unit_price { Faker::Number.decimal(l_digits: 2) }
    association :merchant, factory: :merchant
  end
end