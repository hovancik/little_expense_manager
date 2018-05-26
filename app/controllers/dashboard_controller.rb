class DashboardController < ApplicationController
  before_action :require_login

  def show
    @my_expenses = current_user.expenses
    @accounts = current_user.accounts.order(:name)
  end
end
