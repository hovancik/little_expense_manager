module Loader::AccountsHelper
  def categories_pie_chart_data(expenses)
    expenses.to_a.group_by(&:category)
      .map do |key, value|
        [key.name, value.sum(&:amount)]
      end.to_json
  end

  def paid_by_pie_chart_data(expenses)
    expenses.to_a.group_by(&:payer)
      .map do |key, value|
        [key.name, value.sum(&:amount)]
      end.to_json
  end

  def paid_for_pie_chart_data(expenses)
    expenses.to_a.group_by(&:payer)
      .map do |key, value|
        [key.name, expenses.joins(:users_expenses).where(users_expenses: {user: key}).sum(:amount)]
      end.to_json
  end
end
