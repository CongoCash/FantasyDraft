class AddColumnsToPlayers < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :pass_attempts, :integer
    add_column :players, :pass_completions, :integer
    add_column :players, :pass_yards, :integer
    add_column :players, :pass_td, :integer
    add_column :players, :pass_int, :integer
    add_column :players, :rush_attempts, :integer
    add_column :players, :rush_yards, :integer
    add_column :players, :rush_td, :integer
    add_column :players, :receptions, :integer
    add_column :players, :receive_yards, :integer
    add_column :players, :receive_td, :integer
    add_column :players, :fumbles_lost, :integer
  end
end
