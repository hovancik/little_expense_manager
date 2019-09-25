class ChartsController < ApplicationController
  before_action :require_login
  layout false

  def categories
    account = current_user.accounts.find(params[:account_id])
    expenses = account.this_month_expenses
    render json: ::ChartsService.categories_pie_chart_data(expenses)
  end

  def paid_by
    account = current_user.accounts.find(params[:account_id])
    expenses = account.this_month_expenses
    render json: ::ChartsService.paid_by_pie_chart_data(expenses)
  end

  def paid_for
    account = current_user.accounts.find(params[:account_id])
    expenses = account.this_month_expenses
    render json: ::ChartsService.paid_for_pie_chart_data(expenses)
  end

  def months
    account = current_user.accounts.find(params[:account_id])
    expenses = account.expenses.where(paid_at: Time.zone.now-12.months..Time.zone.now)
    render json: ::ChartsService.months_line_chart_data(expenses)
  end
end
