class ChartsController < ApplicationController
  before_action :require_login
  layout false

  def categories
    month = month(params[:month])
    account = current_user.accounts.find(params[:account_id])
    expenses = account.expenses.from_month(month)
    render json: ::ChartsService.categories_pie_chart_data(expenses)
  end

  def paid_by
    month = month(params[:month])
    account = current_user.accounts.find(params[:account_id])
    expenses = account.expenses.from_month(month)
    render json: ::ChartsService.paid_by_pie_chart_data(expenses)
  end

  def paid_for
    month = month(params[:month])
    account = current_user.accounts.find(params[:account_id])
    expenses = account.expenses.from_month(month)
    render json: ::ChartsService.paid_for_pie_chart_data(expenses)
  end

  def months
    month = month(params[:month])
    account = current_user.accounts.find(params[:account_id])
    expenses = account.expenses.where(paid_at:
      (month-12.months).beginning_of_month..month.end_of_month)
    render json: ::ChartsService.months_line_chart_data(expenses)
  end
end
