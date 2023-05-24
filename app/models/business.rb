class Business < ApplicationRecord
  belongs_to :promoter
  belongs_to :business_type

  has_many :coupons, dependent: :delete_all
  has_many :business_hours, dependent: :delete_all
  has_many :check_ins, dependent: :delete_all

  validates :name, presence: true
end
