require 'test_helper'
module Accounts
  class WhoShouldPayNextServiceTest < ActiveSupport::TestCase
    test "it gives correct values" do
      service = WhoShouldPayNextService.new(accounts(:one).id)
      assert_equal users(:one), service.perform
    end
  end
end
