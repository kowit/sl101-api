class BusinessType < ApplicationRecord
  has_many :businesses

  validates :name, presence: true
end
