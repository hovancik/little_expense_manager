class Bucket < ApplicationRecord
  belongs_to :category
  belongs_to :account

  def set?
    amount.positive?
  end
end
