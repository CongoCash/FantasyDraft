class AddColumnToPlayerWeekStat < ActiveRecord::Migration[5.1]
  def change
    add_column :player_week_stats, :player_id, :integer
    add_column :player_week_stats, :pass_attempts, :integer
    add_column :player_week_stats, :pass_completions, :integer
    add_column :player_week_stats, :pass_yards, :integer
    add_column :player_week_stats, :pass_td, :integer
    add_column :player_week_stats, :pass_int, :integer
    add_column :player_week_stats, :rush_attempts, :integer
    add_column :player_week_stats, :rush_yards, :integer
    add_column :player_week_stats, :rush_td, :integer
    add_column :player_week_stats, :receptions, :integer
    add_column :player_week_stats, :receive_yards, :integer
    add_column :player_week_stats, :receive_td, :integer
    add_column :player_week_stats, :fumbles_lost, :integer
    add_column :player_week_stats, :week, :integer
  end
end
