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

  # API for Promoters (Student Life - Promoter Dashboard)
  namespace :api do
    namespace :v1 do
      namespace :auth do
        post "/signup", to: "registrations#signup"
        post "/signin", to: "sessions#signin"
        post "/signout", to: "sessions#signout"
      end

      namespace :analytics do
        # Businesses
        get "/businesses/phone-clicks", to: "businesses#phone_clicks"
        get "/businesses/website-clicks", to: "businesses#website_clicks"
        get "/businesses/business-clicks", to: "businesses#business_clicks"
        get "/businesses/subscribers-count", to: "businesses#subscribers_count"
        get "/businesses/business-clicks-over-time", to: "businesses#business_clicks_over_time"

        # Coupons
        get "/coupon/impressions", to: "coupons#impressions"
        get "/coupon/clicks", to: "coupons#clicks"
        get "/coupon/redemptions", to: "coupons#redemptions"
      end

      namespace :cms do
        get "/get-business-by-promoter-id/:id", to: "businesses#get_business_by_promoter_id"
        get "/businesses/get-business-name", to: "businesses#get_business_name"
        get "/businesses/get-phone-num", to: "businesses#get_phone_num"
        get "/businesses/get-website-url", to: "businesses#get_website_url"
        get "/businesses/get-coupons", to: "businesses#get_coupons"

        get "/coupons/get-coupons-by-business", to: "coupons#get_coupons_by_business"

        resources :promoters
        resources :businesses
        resources :coupons

        resources :categories, only: %i[index show edit delete]
        resources :business_types, only: %i[index show edit delete]
        resources :cities, only: %i[index show edit delete]
        resources :states, only: %i[index show edit delete]
      end
    end
  end
end
