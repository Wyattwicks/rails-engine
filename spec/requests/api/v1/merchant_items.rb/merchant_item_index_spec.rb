require 'rails_helper'

RSpec.describe  'MerchantItemController', type: :request do 
  describe "merchant item index" do 
    it 'fetches all items that belong to a merchant by ID' do
      merchant = create(:merchant)
      create_list(:item, 10, :merchant_id: merchant.id)

      get "/api/v1/merchants/#{merchant.id}/items"
      
    end
  end
end