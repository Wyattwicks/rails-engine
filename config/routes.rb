Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      #custom
      get '/revenue/merchants', to: "revenue/merchants#index"

      get '/merchants/find', to: "merchants#find"
      
      get '/items/find_all', to: 'items#find_all'

      #resources
      resources :merchants, only: [:index, :show] do
        resources :items, controller: :merchant_items, only: [:index]
      end
      resources :items, only: [:index, :show, :create, :update, :destroy] do
        resources :merchant, controller: :item_merchants, only: [:index]
      end
    end
  end
end

# GET /api/v1/revenue/merchants?quantity=x
