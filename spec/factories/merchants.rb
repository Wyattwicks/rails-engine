FactoryBot.define do
  factory :random_merchant, class: Merchant do
    name {Faker::Space.galaxy}
  end
end