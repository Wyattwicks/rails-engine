class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices

  validates_presence_of :name, :description
  validates :unit_price, presence: true, numericality: true

  def self.total_revenue_ranked(quantity)
    joins({invoice_items: :transactions})
    .where("transactions.result = ?", 'success')
    .where("invoices.status = ?", 'shipped')
    .group(:id)
    .select("items.*, sum(invoice_items.quantity * invoice_items.unit_price) as revenue")
    .order(revenue: :desc)
    .limit(quantity)
  end
end