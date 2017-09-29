class AddHistoryToDrafts < ActiveRecord::Migration[5.1]
  def change
    add_column :drafts, :history, :integer, array: true, default: []
  end
end
