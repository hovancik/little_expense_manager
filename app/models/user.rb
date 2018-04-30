class User < ApplicationRecord
  has_secure_password
  has_secure_token :auth_token
  has_and_belongs_to_many :accounts 

  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 8 }, allow_nil: true
end
