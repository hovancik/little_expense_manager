require 'test_helper'
class ChartsServiceTest < ActiveSupport::TestCase
  test "categories_pie_chart_data" do
    assert_equal '[["Category One","9.99"],["Category Two","30.98"]]', ChartsService.categories_pie_chart_data(Expense.all)
  end

  test "paid_by_pie_chart_data" do
    assert_equal '[["User 1","9.99"],["User 2","30.98"]]', ChartsService.paid_by_pie_chart_data(Expense.all)
  end

  test "paid_for_pie_chart_data" do
    assert_equal '[["User 1","25.99"],["User 2","14.98"]]', ChartsService.paid_for_pie_chart_data(Expense.all)
  end

  test "months_line_chart_data" do
    result = ChartsService.months_line_chart_data(Expense.all)
    assert_equal result[Time.zone.now.strftime('%B %Y')], 30.98
    assert_equal result[(Time.zone.now - 1.month).strftime('%B %Y')], 9.99
  end
end
