class RemoveColumnFromPlayers < ActiveRecord::Migration[5.1]
  def change
    remove_column :players, :pass_attempts
    remove_column :players, :pass_completions
    remove_column :players, :pass_yards
    remove_column :players, :pass_td
    remove_column :players, :pass_int
    remove_column :players, :rush_attempts
    remove_column :players, :rush_yards
    remove_column :players, :rush_td
    remove_column :players, :receptions
    remove_column :players, :receive_yards
    remove_column :players, :receive_td
    remove_column :players, :fumbles_lost
  end
end
