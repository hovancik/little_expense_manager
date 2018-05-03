class Expense < ApplicationRecord
  belongs_to :category
  belongs_to :payer, class_name: 'User'
  belongs_to :account
  has_many :users_expenses

  validates :paid_at, presence: true
  validates :amount, presence: true

  accepts_nested_attributes_for :users_expenses
end
