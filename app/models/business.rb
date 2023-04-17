class Business < ApplicationRecord
  belongs_to :promoter
  has_many :coupons

  validates :name, presence: true
end
