class Room < ApplicationRecord
  has_many :players

  def questioner
    players.find_by(questioner: true)
  end
end
