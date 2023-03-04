class Room < ApplicationRecord
  has_many :players

  def questioner
    players.find_by(questioner: true)
  end

  def answerers
    players.where(questioner: false)
  end

  def change_questioner
    players.update_all(questioner: false)
    players.sample.update(questioner: true)
  end
end
