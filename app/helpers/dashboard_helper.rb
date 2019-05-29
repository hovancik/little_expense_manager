module DashboardHelper
  def bucket_filled(bucket)
    bucket_stats = Buckets::BucketStatusService.new(bucket.id)
    "#{bucket_stats.percentage_filled}%"
  end

  def bucket_spent_amount(bucket)
    bucket_stats = Buckets::BucketStatusService.new(bucket.id)
    "#{bucket_stats.expenses_spent} of #{bucket.amount}"
  end

  def bucket_color_class(bucket)
    bucket_stats = Buckets::BucketStatusService.new(bucket.id)
    case bucket_stats.percentage_filled
    when 0..60 then 'is-success'
    when 61..85 then 'is-warning'
    else 'is-danger'
    end
  end
end
