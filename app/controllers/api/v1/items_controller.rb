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

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      render json: ItemSerializer.new(item), status: :ok
    else
      render json: ItemSerializer.new(item), status: :not_found
    end
  end
    
  def destroy #fix to delete invoice if the item was the only one on it
    @item = Item.find(params[:id])
    render json: Item.delete(@item)
  end

  def find_all
    @items = Item.where("name ilike ?", "%#{params[:name]}%").order(:name)
    render json: ItemSerializer.new(@items)
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