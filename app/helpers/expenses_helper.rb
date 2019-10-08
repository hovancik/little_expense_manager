module ExpensesHelper
  def month_and_year(month)
    month.strftime('%B %Y')
  end
end
