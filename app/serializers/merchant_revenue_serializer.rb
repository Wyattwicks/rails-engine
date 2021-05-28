class MerchantRevenueSerializer
  include FastJsonapi::ObjectSerializer
  attribute :revenue do |object|
    object.single_revenue
  end
end