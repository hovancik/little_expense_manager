class CreateBuckets < ActiveRecord::Migration[5.2]
  def change
    create_table :buckets do |t|
      t.references :category, foreign_key: true
      t.references :account, foreign_key: true
      t.decimal :amount, null: false, default: 0

      t.timestamps
    end
    add_index :buckets, [:category_id, :account_id], unique: true
  end
end
