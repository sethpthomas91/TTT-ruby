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

    context 'when the computer is set to unbeatable and computer is making the second move' do
      it 'should return 5 as the best move' do
        player = computer_player
        player_2 = ComputerPlayer.new('X')
        player.make_unbeatable
        new_board = Board.new
        new_board.player_move_at(player_2, 1)
        expect(computer_player.best_move(new_board)).to eq(5)
      end
    end
    context 'when the computer is set to unbeatable and computer is making the second move' do
      it 'the second cell should be blank' do
        player = computer_player
        player_2 = ComputerPlayer.new('X')
        player.make_unbeatable
        new_board = Board.new
        new_board.player_move_at(player_2, 1)
        next_move = computer_player.best_move(new_board)
        new_board.player_move_at(player, next_move)
        expect(new_board.grid[1].symbol?).to eq(false)
      end
    end
    context 'when the computer is set to unbeatable and computer is making the second move' do
      it 'the fifth cell should have a symbol' do
        player = computer_player
        player_2 = ComputerPlayer.new('X')
        player.make_unbeatable
        new_board = Board.new
        new_board.player_move_at(player_2, 1)
        second_move = computer_player.best_move(new_board)
        new_board.player_move_at(player, second_move)
        expect(second_move).to eq(5)
      end
    end
  end
end
