class Business < ApplicationRecord
  belongs_to :promoter
  belongs_to :business_type

  has_many :coupons

  validates :name, :phone_num, presence: true
end
