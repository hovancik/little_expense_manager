class AddNoteToExpenses < ActiveRecord::Migration[5.2]
  def change
    add_column :expenses, :note, :string
  end
end
