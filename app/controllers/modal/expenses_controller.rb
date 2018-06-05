class Modal::ExpensesController < ApplicationController
  before_action :require_login
  layout false

  def new
    @account = current_user.accounts.find(params[:account_id])
    @expense = Expense.new
    @account.users.each do |user|
      @expense.users_expenses.build(user_id: user.id)
    end
  end

  def edit
    expenses = Expenses::EditableExpensesService.new(current_user).perform
    @expense = expenses.find(params[:id])
  end
end
