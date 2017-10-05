class Player < ApplicationRecord
  has_many :player_teams, dependent: :destroy

  has_many :teams, through: :player_teams

  has_many :player_stat

  has_many :player_week_stats

end
