class Loader::AccountsController < ApplicationController
  before_action :require_login
  layout false

  def data
    from = params[:account_data][:from] || Time.zone.now.beginning_of_month
    to = params[:account_data][:to] || Time.zone.now.end_of_month
    @account = Account.find(params[:account_id])
    @expenses = @account.expenses
      .where(paid_at: from..to)
      .order(:paid_at)
  end
end
