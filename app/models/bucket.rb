class Bucket < ApplicationRecord
  belongs_to :category
  belongs_to :account

  validates :amount, presence: true

  def set?
    amount.positive?
  end
end
