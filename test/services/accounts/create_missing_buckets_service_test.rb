require 'test_helper'
module Accounts
  class CreateMissingBucketsServiceTest < ActiveSupport::TestCase
    test "it gives correct values" do
      service = CreateMissingBucketsService.new(accounts(:one).id)
      assert_difference ->{ accounts(:one).buckets.size }, 1 do
        service.perform
      end
    end
  end
end
