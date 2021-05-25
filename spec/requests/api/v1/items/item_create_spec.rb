require 'rails_helper'

RSpec.describe  'ItemController', type: :request do 
  describe "item create" do
    it "can create a new item" do
      merchant = create :merchant
      post '/api/v1/items', params: {
              name: "value1",
              description: "value2",
              unit_price: 100.99,
              merchant_id: merchant.id
              }
      item = JSON.parse(response.body, symbolize_names: true)
      

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(item[:data][:attributes][:name]).to eq("value1")
      expect(item[:data][:attributes][:description]).to eq("value2")
      expect(item[:data][:attributes][:unit_price]).to eq(100.99)
      expect(item[:data][:attributes][:merchant_id]).to eq(merchant.id)

    end
  end
end