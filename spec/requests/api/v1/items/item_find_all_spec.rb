require 'rails_helper'

RSpec.describe  'ItemController', type: :request do 
  describe "item find all" do
    it "can find all items by name" do
      item1 = create(:item, name:"item1")
      item2 = create(:item, name:"item1")
      item3 = create(:item, name:"xyz")
      search = "item"

      get "/api/v1/items/find_all?name=#{search}"

      expect(response).to be_successful
      items = JSON.parse(response.body, symbolize_names: true)
      expect(items[:data].count).to eq(2)
    end
  end
end