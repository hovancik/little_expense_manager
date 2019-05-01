# Monthly stats for Bucket
module Buckets
  class BucketStatusService
    def initialize(bucket_id)
      @bucket = Bucket.find(bucket_id)
      @account = @bucket.account
      @category = @bucket.category
    end

    def percentage_filled
      return 0 unless @bucket.set?
      (expenses_spent / @bucket.amount * 100).to_i
    end

    def expenses_spent
      return 0 unless @bucket.set?
      @account.expenses
              .where(category: @category,
                paid_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month)
              .sum(:amount)
    end
  end
end
