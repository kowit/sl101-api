Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :business_types
      resources :promoters
      resources :businesses
      resources :coupons

      namespace :analytics do
        get "/businesses/phone-clicks", to: "businesses#phone_clicks"
        get "/businesses/website-clicks", to: "businesses#website_clicks"
        get "/businesses/business-clicks", to: "businesses#business_clicks"
        get "/businesses/subscribers-count", to: "businesses#subscribers_count"
        get "/businesses/business-clicks-over-time", to: "businesses#business_clicks_over_time"
      end

      namespace :auth do
        post "/signup", to: "registrations#signup"
        post "/signin", to: "sessions#signin"
        post "/signout", to: "sessions#signout"
        post "/on-auth-state-changed", to: "sessions#on_auth_state_changed"
      end
    end
  end
end
