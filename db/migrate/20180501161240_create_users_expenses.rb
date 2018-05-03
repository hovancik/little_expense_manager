class CreateUsersExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :users_expenses do |t|
      t.references :user, foreign_key: true
      t.references :expense, foreign_key: true
      t.decimal :amount, null: false

      t.timestamps
    end
  end
end
