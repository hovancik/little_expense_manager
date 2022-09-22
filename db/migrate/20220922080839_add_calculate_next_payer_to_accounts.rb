class AddCalculateNextPayerToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :calculate_next_payer, :boolean, null: false, default: false
  end
end
