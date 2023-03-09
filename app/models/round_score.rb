class RoundScore < ApplicationRecord
  belongs_to :player
  belongs_to :room
end
