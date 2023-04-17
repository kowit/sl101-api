class Business < ApplicationRecord
  belongs_to :promoter

  validates :name, presence: true
end
