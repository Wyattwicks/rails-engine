class Api::V1::ItemsController < ApplicationController
  def index
    @items = Item.limit(per_page).offset(page)
    render json: ItemSerializer.new(@items)
  end

  def show
    @item = Item.find(params[:id])
    render json: ItemSerializer.new(@item)
  end

  def create
    item = Item.create(item_params)
    render json: ItemSerializer.new(item), status: :created
  end
    
  def destroy
    @item = Item.find(params[:id])
    render json: Item.delete(@item)
  end

  private
  def item_params
    params.permit(:name,
                        :description,
                        :unit_price,
                        :merchant_id
                      )
  end
end