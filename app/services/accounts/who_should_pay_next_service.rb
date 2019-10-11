# returns the user that should pay next in shared account
module Accounts
  class WhoShouldPayNextService
    def initialize(account_id)
      @account = Account.find(account_id)
    end

    def perform
      @account.users.sort_by do |user|
        payments_result(user)
      end.first
    end

    # TODO can this be done better?
    def how_much?
      payments_result(perform).abs
    end

    private

    def paid_for(user)
      @account.users_expenses.where(user_id: user.id).sum(:amount)
    end

    def paid_by(user)
      @account.expenses.where(payer_id: user.id).sum(:amount)
    end

    def payments_result(user)
      paid_by(user) - paid_for(user)
    end

  end
end
