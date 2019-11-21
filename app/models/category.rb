class Category < ApplicationRecord
  has_many :expenses
  belongs_to :account

  validates :name, presence: true
  validates :bucket_amount, presence: true

  def self.all_by_the_most_used(account_id)
    Rails.cache.fetch("most_used/#{account_id}", expires_in: 12.hours) do
      Category.where(account_id: account_id).sort_by do |category|
        category.expenses.where(account_id: account_id).size
      end.reverse
    end
  end

  def has_bucket?
    !bucket_amount.zero?
  end
end
