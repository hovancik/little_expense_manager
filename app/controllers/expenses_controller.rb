class ExpensesController < ApplicationController
  before_action :require_login

  def create
    expense = Expense.create(expense_params)
    if expense.valid?
      render json: {
        redirectUrl: account_expenses_path(expense.account)
      }, status: 200
    else
      render json: {
        errors: "Bad params. (#{expense.errors.messages})"
      }, status: 422
    end
  end

  def index
    @account = Account.find(params[:account_id])
    @expenses = @account.expenses
      .where(paid_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month)
      .order(:paid_at)
  end

  private

  def expense_params
    params.require(:expense).permit(:payer_id, :account_id, :amount, :paid_at,
      :category_id, :note, users_expenses_attributes: [:user_id, :amount])
  end
end
