class SendMonthlyReportJob < ApplicationJob
  def perform(month)
    User.where(send_reports: true).each do |user|
      UserMailer.with(user: user, month: month).monthly_report.deliver_later
    end
  end
end
