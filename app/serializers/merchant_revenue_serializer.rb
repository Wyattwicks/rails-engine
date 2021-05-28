class MerchantRevenueSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name
  attribute :revenue do |object|
    object.single_revenue
  end
end