class Coupon < ApplicationRecord
  belongs_to :business

  validates :name,
            :discount_code,
            :start_date,
            :end_date,
            :business_id,
            presence: true
end
