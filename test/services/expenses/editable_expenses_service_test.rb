require 'test_helper'
module Expenses
  class EditableExpensesServiceTest < ActiveSupport::TestCase
    test "it gives correct values" do
      service = EditableExpensesService.new(users(:one))
      assert_equal [expenses(:one).id, expenses(:three).id], service.perform.order(id: :desc).pluck(:id)
    end
  end
end
