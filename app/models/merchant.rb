class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :customers, through: :invoices
  has_many :transactions, through: :invoices
  

  validates_presence_of :name

  def self.total_revenue_ranked(quantity)
    joins(invoice_items: {invoice: :transactions})
    .select('merchants.*, sum(invoice_items.unit_price * invoice_items.quantity) AS revenue')
    .where(transactions: {result: "success"}, invoices: {status: "shipped"})
    .group(:id)
    .order("revenue DESC")
    .limit(quantity)
  end

  def total_revenue
    invoice_items
    .joins(:transactions)
    .where("transactions.result = 'success'")
    .sum("quantity * unit_price")
  end
end