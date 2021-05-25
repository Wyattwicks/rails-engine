require 'rails_helper'

RSpec.describe  'ItemController', type: :request do 
  describe "item show" do
    it "can get a single item based on id" do
      id = create(:item).id

      get "/api/v1/items/#{id}"

      item = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful

      expect(item.count).to eq(1)

      expect(item[:data][:attributes]).to have_key(:name)
      expect(item[:data][:attributes][:name]).to be_a(String)
    end
  end
end