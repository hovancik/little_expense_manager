# returns the expenses that user can edit
module Expenses
  class EditableExpensesService
    def initialize(user)
      @user = user
    end

    def perform
      Expense.where(account: @user.accounts)
    end
  end
end
