# Monthly stats for Bucket
module Categories
  class BucketStatusService
    def initialize(category)
      @category = category
    end

    def percentage_filled
      return 0 if @category.bucket_amount.zero?
      (expenses_spent / @category.bucket_amount * 100).to_i
    end

    def expenses_spent
      return 0 if @category.bucket_amount.zero?
      @category.account.expenses
              .where(category: @category,
                paid_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month)
              .sum(:amount)
    end
  end
end
