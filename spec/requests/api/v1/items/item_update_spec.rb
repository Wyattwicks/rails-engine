require 'rails_helper'

RSpec.describe  'ItemController', type: :request do 
  describe "item update" do
    it "can update an existing item" do
      id = create(:item, id: 1).id
      previous_name = Item.last.name

      patch "/api/v1/items/#{id}", params: { name: "changed item"}

      item = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(item[:data][:attributes][:name]).to_not eq(previous_name)
      expect(item[:data][:attributes][:name]).to eq("changed item")
    end

    it "bad merchant id returns 400 or 404" do
      merchant = create(:merchant, id:5)
      id = create(:item, id: 1, merchant_id: 5).id
      previous_name = Item.last.name

      patch "/api/v1/items/#{id}", params: { name: "changed item", merchant_id: 7}

      item = JSON.parse(response.body, symbolize_names: true)

      expect(response).to_not be_successful
      expect(response.status).to eq(404)
    end
  end
end