class SendYearlyReportJob < ApplicationJob
  def perform(year)
    User.where(send_reports: true) do |user|
      UserMailer.with(user: user, year: year).yearly_report.deliver_later
    end
  end
end
