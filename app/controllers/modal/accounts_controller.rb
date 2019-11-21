class Modal::AccountsController < ApplicationController
  before_action :require_login, :set_refresh_params
  layout false

  def edit
    @account = current_user.accounts.find(params[:id])
  end
end
