class FixColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :teams, :tie, :ties
  end
end
