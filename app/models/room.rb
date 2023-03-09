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
    questioner = players.where(turns_taken: current_round - 1)
    questioner.update(questioner: true)
  end

  def reset_players_answered
    players.update_all(answer: '')
  end

  def reset_players_ready_status
    players.update_all(ready: false)
  end

  def everyone_answered?
    players.where(answer: '').empty?
  end

  def everyone_ready?
    players.where(ready: false).empty?
  end

  def quiz_finished?
    questioner.nil? && rounds == current_round
  end

  def give_points
    answerers.each do |player|
      player.update(score: player.score + 1) if player.answer == questioner.answer
    end
  end
end
