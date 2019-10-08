class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  private

  def month(date)
    if date.present?
      Date.parse(date)
    else
      Time.zone.now
    end
  end

  def current_user
    @current_user ||= User.find_by(auth_token: session[:auth_token]) \
      if session[:auth_token]
  end

  def logged_in?
    current_user != nil
  end

  def require_login
    redirect_to new_session_url unless logged_in?
  end

  def set_refresh_params
    @refresh_id = params[:refresh_id]
    @refresh_url = params[:refresh_url]
  end
end
