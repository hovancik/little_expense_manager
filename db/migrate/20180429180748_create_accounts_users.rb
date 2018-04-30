class CreateAccountsUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts_users do |t|
      t.references :account, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
