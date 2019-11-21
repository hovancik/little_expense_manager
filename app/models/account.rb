class Account < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :expenses
  has_many :users_expenses, through: :expenses
  has_many :categories

  accepts_nested_attributes_for :categories, update_only: true

  def this_month_expenses
    now = Time.zone.now
    expenses
      .where(paid_at: now.beginning_of_month..now.end_of_month)
  end

  def has_buckets?
    !categories.sum(:bucket_amount).zero?
  end
end
