require 'test_helper'
module Buckets
  class BucketStatusServiceTest < ActiveSupport::TestCase
    setup do
      expenses(:one).update(paid_at: Time.zone.now)
    end

    test "percentage_filled is correct" do
      service = BucketStatusService.new(buckets(:one).id)
      assert_equal 99, service.percentage_filled
    end

    test "expenses_spent is correct" do
      service = BucketStatusService.new(buckets(:one).id)
      assert_equal 9.99, service.expenses_spent
    end
  end
end
