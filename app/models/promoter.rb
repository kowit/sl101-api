class Promoter < ApplicationRecord
  has_many :businesses

  validates :email, presence: true, uniqueness: true
end
