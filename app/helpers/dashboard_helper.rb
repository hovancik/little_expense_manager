module DashboardHelper
  def bucket_filled(category)
    bucket_stats = Categories::BucketStatusService.new(category)
    "#{bucket_stats.percentage_filled}%"
  end

  def bucket_spent_amount(category)
    bucket_stats = Categories::BucketStatusService.new(category)
    "#{bucket_stats.expenses_spent} of #{category.bucket_amount}"
  end

  def bucket_color_class(category)
    bucket_stats = Categories::BucketStatusService.new(category)
    case bucket_stats.percentage_filled
    when 0..60 then 'is-success'
    when 61..85 then 'is-warning'
    else 'is-danger'
    end
  end
end
