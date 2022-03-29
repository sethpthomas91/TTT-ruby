require_relative '../lib/computer_player'
require_relative '../lib/board'

RSpec.describe ComputerPlayer do
  let(:computer_player) { ComputerPlayer.new }

  describe '#random_move' do
    it 'should return a random integer from the given array of available moves' do
      available_moves = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      expect(computer_player.random_move(available_moves)).to be_between(1, 9)
    end
  end

  describe '#marker' do
    it 'should return an O' do
      expect(computer_player.marker).to eq('O')
    end
  end

  describe '#assign_marker_as' do
    it 'should return an X' do
      expect(computer_player.assign_marker_as('X')).to eq('X')
    end
  end

  describe '#make_unbeatable' do
    it 'should change the setting of the computer to unbeatable' do
      computer_player.make_unbeatable
      expect(computer_player.is_unbeatable).to eq(true)
    end
  end

  describe '#best_move' do
    context 'when the computer is set to unbeatable and computer is making the first move' do
      it 'should return 1 as the best move' do
        player = computer_player
        player.make_unbeatable
        board = Board.new
        expect(computer_player.best_move(board)).to eq(1)
      end
    end
  end
end
