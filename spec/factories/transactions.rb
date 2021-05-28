FactoryBot.define do
  factory :transaction, class: Transaction do
    credit_card_number { Faker::Business.credit_card_number.gsub('-', '') }
    credit_card_expiration_date { Faker::Business.credit_card_expiry_date }
    result { ["failed", "success"] }

    association :invoice, factory: :invoice
  end
end