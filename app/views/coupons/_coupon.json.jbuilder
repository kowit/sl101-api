json.extract! coupon, :id, :name, :discount_code, :start_date, :created_at, :updated_at
json.url coupon_url(coupon, format: :json)
