class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  private

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
end
