require 'rails_helper'

RSpec.describe 'MerchantController', type: :request do 
  describe "merchant show" do
    it "can get a single merchant based on id" do
      id = create(:merchant).id

      get "/api/v1/merchants/#{id}"

      merchant = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful

      expect(merchant.count).to eq(1)

      expect(merchant[:data][:attributes]).to have_key(:name)
      expect(merchant[:data][:attributes][:name]).to be_a(String)
    end
  end
end