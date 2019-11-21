class AddBucketAmountToCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :bucket_amount, :decimal, null: false, default: 0
    # NOTE: migrate with
    # Category.all.each {|c| c.update(bucket_amount: c.bucket.amount)}
  end
end
