class AddColumnsToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :rank, :integer
    add_column :teams, :wins, :integer
    add_column :teams, :losses, :integer
    add_column :teams, :tie, :integer
    add_column :teams, :points_for, :decimal
    add_column :teams, :points_against, :decimal
    add_column :teams, :moves, :integer

  end
end
