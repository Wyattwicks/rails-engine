require 'rails_helper'

RSpec.describe 'MerchantController', type: :request do 
  describe "merchant find" do 
    it 'can find one merchant by name fragment' do
      merchant1 = create(:merchant, name:"merchant1")
      merchant2 = create(:merchant, name:"merchantdos")

      test_name = "dos"
      get "/api/v1/merchants/find?name=#{test_name}"

      merchant = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(merchant[:data][:attributes][:name]).to eq("merchantdos")
    end

    it 'shows error if no match is found' do
      merchant1 = create(:merchant, name:"merchant1")
      merchant2 = create(:merchant, name:"merchantdos")

      test_name = "xyz"
      get "/api/v1/merchants/find?name=#{test_name}"

      merchant = JSON.parse(response.body, symbolize_names: true)
      expect(response).to_not be_successful
      expect(response.status).to eq(404)
    end
  end
end