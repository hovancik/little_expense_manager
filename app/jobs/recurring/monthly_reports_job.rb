# Send monthly report emails
module Recurring
  class MonthlyReportsJob
    include Delayed::RecurringJob
    run_every 1.month
    run_at Time.zone.now.beginning_of_month + 1.day

    def perform
      SendMonthlyReportJob.perform_later(1.month.ago.to_i)
    end
  end
end
