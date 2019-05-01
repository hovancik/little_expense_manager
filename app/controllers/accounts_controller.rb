class AccountsController < ApplicationController
  before_action :require_login

  def update
    account = current_user.accounts.find(params[:id])
    if account.update(account_params)
      render json: {
      }, status: 200
    else
      render json: {
        errors: "Bad params. (#{account.errors.messages})"
      }, status: 422
    end
  end

  private

  def account_params
    params.require(:account).permit(buckets_attributes: [:category_id, :amount, :id])
  end
end
