require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  test 'should return the datasets for the line graph' do
    room = FactoryBot.create(:room)
    player_1 = FactoryBot.create(:player, name: 'Player 1', room: room)
    player_2 = FactoryBot.create(:player, name: 'Player 2', room: room)
    FactoryBot.create(:round_score, player: player_1, score: 12, room: room, round: 1)
    FactoryBot.create(:round_score, player: player_1, score: 20, room: room, round: 2)
    FactoryBot.create(:round_score, player: player_2, score: 8, room: room, round: 1)
    FactoryBot.create(:round_score, player: player_2, score: 14, room: room, round: 2)

    formatted_data = [
      {
        label: 'Player 1',
        data: [12, 20],
        borderWidth: 1
      },
      {
        label: 'Player 2',
        data: [8, 14],
        borderWidth: 1
      }
    ]

    assert_equal room.players_scores_for_line_graph, formatted_data
  end
end
