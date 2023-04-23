class Promoter < ApplicationRecord
  has_many :businesses, dependent: :delete_all

  validates :email, presence: true, uniqueness: true
end
