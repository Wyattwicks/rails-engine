require 'rails_helper'

RSpec.describe  'ItemController', type: :request do 
  describe "Index" do 
    it 'returns 20 items per page by default' do
      create_list(:item, 21)
      get '/api/v1/items'

      expect(response).to be_successful

      items = JSON.parse(response.body, symbolize_names: true)

      expect(items[:data].count).to eq(20)

      items[:data].each do  |item|
        expect(item[:attributes]).to have_key(:name)
        expect(item[:attributes][:name]).to be_a(String)
        expect(item[:attributes]).to have_key(:description)
        expect(item[:attributes][:description]).to be_a(String)
        expect(item[:attributes]).to have_key(:unit_price)
        expect(item[:attributes][:unit_price]).to be_a(Float)
      end
    end

    it "can fetch items by per page" do
      create_list(:item, 100)

      get '/api/v1/items', params: { per_page: 40 }

      expect(response).to be_successful

      items = JSON.parse(response.body, symbolize_names: true)

      expect(items[:data].count).to eq(40)
    end

    it "can fetch items by page number" do
      create_list(:item, 40)

      get '/api/v1/items', params: { page: 2 }

      expect(response).to be_successful

      items = JSON.parse(response.body, symbolize_names: true)

      expect(items[:data].count).to eq(20)
      expect(items[:data].first[:attributes][:name]).to eq(Item.all[20].name)
    end

    it 'can fetch a page of items which would contain no data' do
      get '/api/v1/items'

      expect(response).to be_successful

      items = JSON.parse(response.body, symbolize_names: true)

      expect(items[:data].count).to eq(0)
      expect(items[:data]).to be_an(Array)
    end
  end

  describe "Show" do
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

  describe "Create" do
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
      expect(item[:data][:attributes][:name]).to eq("value1")
      expect(item[:data][:attributes][:description]).to eq("value2")
      expect(item[:data][:attributes][:unit_price]).to eq(100.99)
      expect(item[:data][:attributes][:merchant_id]).to eq(merchant.id)
    end
  end

end