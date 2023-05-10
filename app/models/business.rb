class Business < ApplicationRecord
  belongs_to :promoter
  belongs_to :business_type

  has_many :coupons, dependent: :delete_all

  validates :name, presence: true, uniqueness: true
  validates :phone_num, uniqueness: true
  validates :website_url, uniqueness: true
end
