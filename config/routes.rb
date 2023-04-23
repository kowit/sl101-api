Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :business_types
      resources :users
      resources :promoters
      resources :businesses
      resources :coupons
      resources :categories
      resources :cities
      resources :states
    end
  end
end
