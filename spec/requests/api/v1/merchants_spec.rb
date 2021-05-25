require 'rails_helper'

RSpec.describe 'MerchantController', type: :request do 
  before :each do
    @merchant1 = Merchant.create(name: Faker::Name.name, id: 1)
    @merchant2 = Merchant.create(name: Faker::Name.name, id: 2)
    @merchant3 = Merchant.create(name: Faker::Name.name, id: 3)
    @merchant4 = Merchant.create(name: Faker::Name.name, id: 4)
    @merchant5 = Merchant.create(name: Faker::Name.name, id: 5)
  end

  
  
end