FactoryBot.define do
  factory :merchant, class: Merchant do
    name {Faker::Space.galaxy}
  end
end