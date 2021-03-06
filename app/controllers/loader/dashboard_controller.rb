class Loader::DashboardController < ApplicationController
  before_action :require_login
  layout false

  def show
    @my_expenses = current_user.expenses
    @accounts = current_user.accounts.includes(:categories).order(:name)
  end
end
