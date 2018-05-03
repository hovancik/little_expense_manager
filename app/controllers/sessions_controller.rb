class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      session[:auth_token] = user.auth_token
      render json: {
        redirectUrl: dashboard_url
      }, status: 200
    else
      render json: {
        errors: 'Bad email or password.'
      }, status: 422
    end
  end

  def destroy
    session[:auth_token] = nil
    redirect_to root_url
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
