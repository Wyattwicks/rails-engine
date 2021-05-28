class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices
  

  validates_presence_of :name

  def self.total_revenue_ranked(quantity)
    joins(items: {invoice_items: {invoice: :transactions}})
    .where("transactions.result = ?", 'success')
    .where("invoices.status = ?", 'shipped')
    .group(:id)
    .select("merchants.*, sum(invoice_items.quantity * invoice_items.unit_price) as revenue")
    .order(revenue: :desc)
    .limit(quantity)
  end

  def single_revenue
    invoice_items
    .joins(:transactions)
    .where("transactions.result = 'success'")
    .sum("quantity * unit_price")
  end
end