class Business < ApplicationRecord
  belongs_to :promoter, :business_type

  has_many :coupons

  validates :name, :phone_num, presence: true
end
