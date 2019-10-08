class ExpensesController < ApplicationController
  before_action :require_login

  def create
    expense = Expense.create(expense_params)
    if expense.valid?
      render json: {}, status: 200
    else
      render json: {
        errors: "Error has occured. (#{expense.errors.full_messages.join(', ')})"
      }, status: 422
    end
  end

  def index
    @month = month(params[:month])
    @account = current_user.accounts.find(params[:account_id])
    @expenses = @account.expenses.includes(:payer,:users_expenses,:category).from_month(@month)
  end

  def update
    expenses = Expenses::EditableExpensesService.new(current_user).perform
    expense = expenses.find(params[:id])
    if expense.update(expense_params)
      render json: {}, status: 200
    else
      render json: {
        errors: "Error has occured. (#{expense.errors.full_messages.join(', ')})"
      }, status: 422
    end
  end

  def destroy
    expenses = Expenses::EditableExpensesService.new(current_user).perform
    expense = expenses.find(params[:id])
    expense.destroy
    if expense.destroyed?
      render json: {}, status: 200
    else
      render json: {
        errors: "Error has occured. (#{expense.errors.full_messages.join(', ')})"
      }, status: 422
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:payer_id, :account_id, :amount, :paid_at,
      :category_id, :note, users_expenses_attributes: [:user_id, :amount, :id])
  end
end
