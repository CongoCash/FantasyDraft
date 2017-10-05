class Team < ApplicationRecord
  belongs_to :league
  belongs_to :user
  has_many :player_teams, dependent: :destroy
  has_many :players , through: :player_teams
  validates_uniqueness_of :name                          

end
