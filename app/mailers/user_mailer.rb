class UserMailer < ApplicationMailer
  default from: 'no-reply@lem.technology'

  def monthly_report
    @user = params[:user]
    @month = Time.at(params[:month])
    mail(to: @user.email, subject: 'Your monthly report from LEM')
  end
end
