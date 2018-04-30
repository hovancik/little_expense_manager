class DashboardController < ApplicationController
  before_action :require_login

  def show
    @accounts = current_user.accounts
  end
end
