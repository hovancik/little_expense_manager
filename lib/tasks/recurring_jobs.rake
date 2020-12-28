namespace :recurring do
  task init: :environment do
    Recurring::MonthlyReportsJob.schedule!
    Recurring::YearlyReportsJob.schedule!
  end
end
