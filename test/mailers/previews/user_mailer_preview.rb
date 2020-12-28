# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def monthly_report
    UserMailer.with(user: User.first, month: Time.zone.now).monthly_report
  end

  def yearly_report
    UserMailer.with(user: User.first, year: Time.zone.now).yearly_report
  end
end
