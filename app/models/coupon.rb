class Coupon < ApplicationRecord
  belongs_to :business

  validates :name, presence: true
  validates :discount_code, presence: true
end
