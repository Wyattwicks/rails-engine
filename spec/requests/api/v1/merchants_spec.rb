require 'rails_helper'

RSpec.describe 'MerchantController', type: :request do 
  before :each do
    @merchant1 = Merchant.create(name: Faker::Name.name, id: 1)
    @merchant2 = Merchant.create(name: Faker::Name.name, id: 2)
    @merchant3 = Merchant.create(name: Faker::Name.name, id: 3)
    @merchant4 = Merchant.create(name: Faker::Name.name, id: 4)
    @merchant5 = Merchant.create(name: Faker::Name.name, id: 5)
    @merchant1 = Merchant.create(name: Faker::Name.name, id: 6)
    @merchant2 = Merchant.create(name: Faker::Name.name, id: 7)
    @merchant3 = Merchant.create(name: Faker::Name.name, id: 8)
    @merchant4 = Merchant.create(name: Faker::Name.name, id: 9)
    @merchant5 = Merchant.create(name: Faker::Name.name, id: 10)
    @merchant1 = Merchant.create(name: Faker::Name.name, id: 11)
    @merchant2 = Merchant.create(name: Faker::Name.name, id: 12)
    @merchant3 = Merchant.create(name: Faker::Name.name, id: 13)
    @merchant4 = Merchant.create(name: Faker::Name.name, id: 14)
    @merchant5 = Merchant.create(name: Faker::Name.name, id: 15)
    @merchant1 = Merchant.create(name: Faker::Name.name, id: 16)
    @merchant2 = Merchant.create(name: Faker::Name.name, id: 17)
    @merchant3 = Merchant.create(name: Faker::Name.name, id: 18)
    @merchant4 = Merchant.create(name: Faker::Name.name, id: 19)
    @merchant5 = Merchant.create(name: Faker::Name.name, id: 20)
  end

  describe "get all merchants" do 
    it 'returns all merchants' do
      get '/api/v1/merchants'

    expect(response).to be_successful

    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(merchants[:data].count).to eq(20)

      merchants[:data].each do |merchant|
        expect(merchant[:attributes]).to have_key(:name)
        expect(merchant[:attributes][:name]).to be_a(String)
      end
    end
  end
end