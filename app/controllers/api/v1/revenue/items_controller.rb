class Api::V1::Revenue::ItemsController < ApplicationController
  def total_revenue
    if params[:quantity].to_i > 0 && params[:quantity].present?
      @items = Item.total_revenue_ranked(params[:quantity])
      render json: ItemRevenueSerializer.new(@items)
    else
      render json: { error: "error"}, status: 400
    end
  end
end