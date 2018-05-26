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
    @account = current_user.accounts.find(params[:account_id])
  end

  def update
    expense = current_user.exepenses.find(params[:id])
    if expense.update(expense_params)
      render json: {
        redirectUrl: account_expenses_path(expense.account)
      }, status: 200
    else
      render json: {
        errors: "Bad params. (#{expense.errors.messages})"
      }, status: 422
    end
  end

  def destroy
    expense = current_user.exepenses.find(params[:id])
    expense.destroy
    redirect_to account_expenses_path(expense.account)
  end

  private

  def expense_params
    params.require(:expense).permit(:payer_id, :account_id, :amount, :paid_at,
      :category_id, :note, users_expenses_attributes: [:user_id, :amount, :id])
  end
end
