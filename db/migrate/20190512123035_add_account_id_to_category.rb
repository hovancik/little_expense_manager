# Do not forget to migrate existing categories
class AddAccountIdToCategory < ActiveRecord::Migration[5.2]
  def change
    add_reference :categories, :account, foreign_key: true
  end
end
