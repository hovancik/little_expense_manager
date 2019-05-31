class Expense < ApplicationRecord
  belongs_to :category
  belongs_to :payer, class_name: 'User'
  belongs_to :account
  has_many :users_expenses, dependent: :destroy

  validates :paid_at, presence: true
  validates :amount, presence: true
  validate :users_expenses_add_up_to_amount, on: [:create, :update]

  accepts_nested_attributes_for :users_expenses

  scope :from_this_month, -> {
    where(paid_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month)
  }

  scope :from_month, ->(month) {
    where(paid_at: month.beginning_of_month..month.end_of_month)
  }

  private

  def users_expenses_add_up_to_amount
    errors.add(:amount, "#{users_expenses.map(&:amount).join('+')}!=#{amount}") \
      unless amount === users_expenses.sum(&:amount)
  end
end
