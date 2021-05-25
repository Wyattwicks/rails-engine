require 'rails_helper'

RSpec.describe  'ItemController', type: :request do 
  describe "item destroy" do
    it "can delete an item" do
      item = create(:item, id: 1)

      expect(Item.count).to eq(1)

      delete "/api/v1/items/#{item.id}"

      expect(response).to be_successful
      expect(Item.count).to eq(0)
    end
  end
end