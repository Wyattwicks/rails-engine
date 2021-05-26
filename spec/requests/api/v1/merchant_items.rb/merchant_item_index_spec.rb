require 'rails_helper'

RSpec.describe  'MerchantItemController', type: :request do 
  describe "merchant item index" do 
    it 'fetches all items that belong to a merchant by ID' do
      merchant = create(:merchant)
      extra_merchant = create(:merchant)
      other_item = create(:item, merchant_id: extra_merchant.id)
      create_list(:item, 10, merchant_id: merchant.id)


      get "/api/v1/merchants/#{merchant.id}/items"
      
      items = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(items[:data].count).to eq(10)
    end
  end
end