class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items

  validates_presence_of :name, :description
  validates :unit_price, presence: true, numericality: true
end