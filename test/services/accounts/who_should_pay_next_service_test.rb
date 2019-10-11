require 'test_helper'
module Accounts
  class WhoShouldPayNextServiceTest < ActiveSupport::TestCase
    test "it gives correct user" do
      service = WhoShouldPayNextService.new(accounts(:one).id)
      assert_equal users(:one), service.perform
    end

    test "it gives correct value for how much" do
      service = WhoShouldPayNextService.new(accounts(:one).id)
      assert_equal 16.0, service.how_much?
    end
  end
end
