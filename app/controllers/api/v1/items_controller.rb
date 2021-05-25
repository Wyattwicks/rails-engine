class Api::V1::ItemsController < ApplicationController
  def index
    @items = Item.limit(per_page).offset(page)
    render json: ItemSerializer.new(@items)
  end

  def show
    @item = Item.find(params[:id])
    render json: ItemSerializer.new(@item)
  end

  def create #fix to destroy fake items for postman test to pass
    item = Item.create(item_params)
    render json: ItemSerializer.new(item), status: :created
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      render json: ItemSerializer.new(item), status: :ok
    else
      render json: ItemSerializer.new(item), status: :not_found
    end
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