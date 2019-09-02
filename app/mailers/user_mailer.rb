class UserMailer < ApplicationMailer
  default from: 'no-reply@lemur.app'

  def monthly_report
    @user = params[:user]
    @month = Time.at(params[:month])
    mail(to: @user.email, subject: 'Your monthly report from LEM')
  end
end
