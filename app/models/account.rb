class Account < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :expenses

  def this_month_expenses
    now = Time.zone.now
    expenses
      .where(paid_at: now.beginning_of_month..now.end_of_month)
      .sum(:amount)
  end
end
