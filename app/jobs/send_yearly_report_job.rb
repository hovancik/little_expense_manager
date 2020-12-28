class SendYearlyReportJob < ApplicationJob
  def perform(year)
    User.find_each do |user|
      UserMailer.with(user: user, year: year).yearly_report.deliver_later
    end
  end
end
