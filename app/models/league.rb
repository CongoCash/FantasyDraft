class League < ApplicationRecord
  has_one :draft
  belongs_to :user
  
  has_many :teams
  has_many :players, through: :teams
end
