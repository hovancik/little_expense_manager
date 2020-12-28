class User < ApplicationRecord
  has_secure_password
  has_secure_token :auth_token
  has_and_belongs_to_many :accounts
  has_many :users_expenses
  has_many :expenses, foreign_key: 'payer_id'

  validates :email, presence: true, uniqueness: true
  validates :send_reports, presence: true
  validates :password, length: { minimum: 8 }, allow_nil: true
end
