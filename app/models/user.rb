class User < ApplicationRecord
  has_secure_password

  validates :email, :password_digest, presence: true
  validates :email, uniqueness: true
  validates :password_digest, confirmation: true

  has_many :employees
end
