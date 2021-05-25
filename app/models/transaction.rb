class Transaction < ApplicationRecord
  belongs_to :invoice

  validates :credit_card_number, presence: true, length: {is: 16}
end