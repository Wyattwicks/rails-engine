class Api::V1::Revenue::MerchantsController < ApplicationController
  def total_revenue
    if params[:quantity].to_i > 0 && params[:quantity].present?
      @merchants = Merchant.total_revenue_ranked(params[:quantity])
      render json: MerchantNameRevenueSerializer.new(@merchants)
    else
      render json: { error: "error"}, status: 400
    end
  end
  
  def single_merchant_revenue
    @merchant = Merchant.find(params[:id])
    render json: MerchantRevenueSerializer.new(@merchant)
  end

end