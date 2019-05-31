namespace :recurring do
  task init: :environment do
    Recurring::MonthlyReportsJob.schedule!
  end
end
