Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      #custom
      get '/revenue/merchants', to: "revenue/merchants#index"

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
