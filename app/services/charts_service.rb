class ChartsService
  class << self
    def categories_pie_chart_data(expenses)
      expenses.includes(:category).to_a.group_by(&:category)
        .map do |key, value|
          [key.name, value.sum(&:amount)]
        end.to_json
    end

    def paid_by_pie_chart_data(expenses)
      expenses.includes(:payer).to_a.group_by(&:payer)
        .map do |key, value|
          [key.name, value.sum(&:amount)]
        end.to_json
    end

    def paid_for_pie_chart_data(expenses)
      expenses.includes(:payer).to_a.group_by(&:payer)
        .map do |key, value|
          [key.name, expenses.joins(:users_expenses).where(users_expenses: {user_id: key.id}).sum('users_expenses.amount')]
        end.to_json
    end

    def months_line_chart_data(expenses)
      expenses.group_by_month(:paid_at, format: "%b %Y").sum(:amount)
    end
  end
end
