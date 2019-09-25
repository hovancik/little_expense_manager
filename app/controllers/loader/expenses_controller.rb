class Loader::ExpensesController < ApplicationController
  before_action :require_login
  layout false

  def index
    @account = current_user.accounts.find(params[:account_id])
    @expenses = @account.expenses.includes(:payer,:users_expenses,:category).from_this_month
  end
end
