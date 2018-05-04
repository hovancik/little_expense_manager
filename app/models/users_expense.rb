class UsersExpense < ApplicationRecord
  belongs_to :user
  belongs_to :expense

  validates :amount, presence: true
end
