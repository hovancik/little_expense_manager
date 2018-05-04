class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.references :category, foreign_key: true
      t.references :payer, foreign_key: {to_table: :users}
      t.references :account, foreign_key: true
      t.timestamp :paid_at, null: false
      t.decimal :amount, null: false

      t.timestamps
    end
  end
end
