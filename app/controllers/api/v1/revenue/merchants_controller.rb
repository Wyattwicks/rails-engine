class Api::V1::Revenue::MerchantsController < ApplicationController
  def index
    @merchants = Merchant.total_revenue(params[:quantity])
    render json: MerchantRevenueSerializer.new(@merchants)
  end
end