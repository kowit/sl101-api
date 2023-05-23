Rails.application.routes.draw do
  # API for Users (Student Life 101 - React Native Expo Apps)
  namespace :api do
    namespace :v1 do
      post "/signup", to: "registrations#signup"
      post "/signin", to: "sessions#signin"
      post "/signout", to: "sessions#signout"

      # handles redeeming coupons
      post "/redeem-coupon", to: "coupons#redeem_coupon"
      post "/bookmark-coupon", to: "coupons#bookmark_coupon"
      post "/favorite-business", to: "business#favorite_business"

      resources :users, only: %i[show edit delete]
      resources :businesses, only: %i[index, show]
      resources :coupons, only: %i[index, show]
    end
  end

  # API for Promoters (Student Life 101 - Promoter Dashboard)
  namespace :api do
    namespace :v1 do
      namespace :cms do

        # Authentication
        post "/signup", to: "registrations#signup"
        post "/signin", to: "sessions#signin"
        post "/signout", to: "sessions#signout"

        get "/get-business-by-promoter-id/:id", to: "businesses#get_business_by_promoter_id"

        resources :promoters
        resources :businesses
        resources :coupons

        # Meta
        resources :categories, only: %i[index show edit delete]
        resources :business_types, only: %i[index show edit delete]
        resources :cities, only: %i[index show edit delete]
        resources :states, only: %i[index show edit delete]
      end
    end
  end
end
