class ChangeColumnsToTeams < ActiveRecord::Migration[5.1]
  def change
    change_column :teams, :rank, :integer, :default=>0
    change_column :teams, :wins, :integer, :default=>0
    change_column :teams, :losses, :integer, :default=>0
    change_column :teams, :tie, :integer, :default=>0
    change_column :teams, :points_for, :decimal, :default=>0
    change_column :teams, :points_against, :decimal, :default=>0
    change_column :teams, :moves, :integer, :default=>0
  end
end
