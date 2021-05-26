require 'rails_helper'

RSpec.describe  'ItemMerchantController', type: :request do 
  describe "item merchant index" do 
    it "fetches an item's merchant by item ID" do
      merchant = create(:merchant, id: 2)
      item = create(:item, merchant_id: 2)


      get "/api/v1/items/#{item.id}/merchant"
      
      items = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(item.merchant_id).to eq(2)
    end
  end
end