class Promoter < ApplicationRecord
  has_secure_password

  has_many :businesses, dependent: :delete_all

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password_digest, presence: true
end
