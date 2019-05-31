class SendMonthlyReportJob < ApplicationJob
  def perform(month)
    User.find_each do |user|
      UserMailer.with(user: user, month: month).monthly_report.deliver_later
    end
  end
end
