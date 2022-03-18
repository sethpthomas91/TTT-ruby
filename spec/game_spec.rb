require_relative '../lib/game'
require_relative '../lib/human_player'

RSpec.describe Game do
  let(:game) { Game.new(player_one = HumanPlayer.new, player_two = HumanPlayer.new) }

  describe '#check_is_valid_human_move' do
    it 'should allow a user to play in a valid space' do
      expect(game.check_is_valid_human_move(1)).to eq(1)
    end
  end

  describe '#check_is_valid_computer_move' do
    it 'should allow a user to play in a valid space' do
      expect(game.check_is_valid_computer_move(1)).to eq(1)
    end
  end
end
