class AddLeagueToDrafts < ActiveRecord::Migration[5.1]
  def change
    add_reference :drafts, :league, foreign_key: true
  end
end
