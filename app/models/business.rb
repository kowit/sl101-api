class Business < ApplicationRecord
  belongs_to :promoter

  has_many :coupons

  validates :name, :phone_num, presence: true
end
