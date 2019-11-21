class DropBuckets < ActiveRecord::Migration[6.0]
  def change
    drop_table :buckets
  end
end
