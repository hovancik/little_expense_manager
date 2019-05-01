class Modal::AccountsController < ApplicationController
  before_action :require_login
  layout false

  def edit
    service = Accounts::CreateMissingBucketsService.new(params[:id])
    service.perform
    @account = current_user.accounts.find(params[:id])
  end
end
