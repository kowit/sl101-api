class Coupon < ApplicationRecord
  belongs_to :business

  has_many :impressions
end
