class ChangeDefaultInPlayerStat < ActiveRecord::Migration[5.1]
  def change
    change_column :player_stats, :player_id, :integer, :default=>0
    change_column :player_stats, :pass_attempts, :integer, :default=>0
    change_column :player_stats, :pass_completions, :integer, :default=>0
    change_column :player_stats, :pass_yards, :integer, :default=>0
    change_column :player_stats, :pass_td, :integer, :default=>0
    change_column :player_stats, :pass_int, :integer, :default=>0
    change_column :player_stats, :rush_attempts, :integer, :default=>0
    change_column :player_stats, :rush_yards, :integer, :default=>0
    change_column :player_stats, :rush_td, :integer, :default=>0
    change_column :player_stats, :receptions, :integer, :default=>0
    change_column :player_stats, :receive_yards, :integer, :default=>0
    change_column :player_stats, :receive_td, :integer, :default=>0
    change_column :player_stats, :fumbles_lost, :integer, :default=>0
  end
end
