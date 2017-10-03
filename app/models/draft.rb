class Draft < ApplicationRecord
  belongs_to :league
  has_many :comments, dependent: :destroy
end
