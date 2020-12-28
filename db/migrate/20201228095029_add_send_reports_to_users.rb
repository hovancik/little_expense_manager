class AddSendReportsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :send_reports, :boolean, null: false, default: false
  end
end
