require 'rails_helper'

RSpec.describe 'MerchantController', type: :request do 
  describe "index" do 
    it 'returns 20 merchants per page by default' do
      create_list(:merchant, 21)
      get '/api/v1/merchants'

      expect(response).to be_successful

      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(merchants[:data].count).to eq(20)

      merchants[:data].each do |merchant|
        expect(merchant[:attributes]).to have_key(:name)
        expect(merchant[:attributes][:name]).to be_a(String)
      end
    end

    it "can fetch merchants by per page" do
      create_list(:merchant, 100)

      get '/api/v1/merchants', params: { per_page: 40 }

      expect(response).to be_successful

      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(merchants[:data].count).to eq(40)
    end

    it "can fetch merchants by page number" do
      create_list(:merchant, 40)

      get '/api/v1/merchants', params: { page: 2 }

      expect(response).to be_successful

      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(merchants[:data].count).to eq(20)
      expect(merchants[:data].first[:attributes][:name]).to eq(Merchant.all[20].name)
    end

    it 'can fetch a page of merchants which would contain no data' do
      get '/api/v1/merchants'

      expect(response).to be_successful

      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(merchants[:data].count).to eq(0)
      expect(merchants[:data]).to be_an(Array)
    end
  end

  describe "Show" do
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