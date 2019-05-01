# create missing buckets for account
module Accounts
  class CreateMissingBucketsService
    def initialize(account_id)
      @account = Account.find(account_id)
      @buckets = @account.buckets
      @categories = Category.all
    end

    def perform
      return if @buckets.size == @categories.size
      @categories.each do |category|
        Bucket.create(category: category, account: @account) \
          unless @buckets.where(category: category).present?
      end
    end
  end
end
