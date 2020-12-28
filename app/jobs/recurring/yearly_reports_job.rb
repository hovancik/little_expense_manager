# Send yearly report emails
module Recurring
  class YearlyReportsJob
    include Delayed::RecurringJob
    run_every 1.year
    run_at Time.zone.now.change(month: 1).beginning_of_month + 1.day

    def perform
      SendYearlyReportJob.perform_later(1.year.ago.to_i)
    end
  end
end
