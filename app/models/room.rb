class Room < ApplicationRecord
  has_many :players

  def questioner
    players.find_by(questioner: true)
  end

  def answerers
    players.where(questioner: false)
  end

  def player_positions
    players.all.order(score: :desc)
  end

  def change_questioner
    players.update_all(questioner: false)
    players.sample.update(questioner: true)
  end

  def reset_players_answered
    players.update_all(answer: '')
  end

  def everyone_answered?
    players.where(answer: '').empty?
  end

  def give_points
    answerers.each do |player|
      player.update(score: player.score + 1) if player.answer == questioner.answer
    end
  end
end
