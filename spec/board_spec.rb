require_relative '../lib/board'
require_relative '../lib/computer_player'

RSpec.describe Board do
  let(:board) { Board.new }

  it 'should create a new board that has nine (base one) objects' do
    expect(board.grid.length).to eq(9)
  end

  describe '#player_move_at' do
    it 'should change a cell symbol at a specified grid to the player mark' do
      user_input = 1
      player = ComputerPlayer.new('X')
      board.player_move_at(player, user_input)
      expect(board.grid[0].symbol).to eq('X')
    end
  end

  describe '#make_symbol_arr' do
    it 'should return a correct symbol array' do
      board.grid[0].change_symbol_to('O')
      board.grid[1].change_symbol_to('O')
      board.grid[2].change_symbol_to('O')
      expect(board.make_symbol_arr).to eq(['O', 'O', 'O', ' ', ' ', ' ', ' ', ' ', ' '])
    end
  end

  describe '#valid_move?' do
    it 'should return false when an index has already been played' do
      player = ComputerPlayer.new('X')
      user_input = 1
      board.player_move_at(player, user_input)
      expect(board.valid_move?(1)).to eq(false)
    end
  end

  describe '#valid_move?' do
    it 'should return true when a cell has not been played' do
      expect(board.valid_move?(1)).to eq(true)
    end
  end

  describe '#change_user_input_to_index' do
    it 'should convert a user input of 1 to 0' do
      expect(board.change_user_input_to_index(1)).to eq(0)
    end
  end

  describe '#change_user_input_to_index' do
    it 'should not convert a user input from 7 to 0' do
      expect(board.change_user_input_to_index(7)).not_to eq(0)
    end
  end

  describe '#player_undo_move_at' do
    it 'should change a cell symbol at a specified grid back to blank' do
      user_input = 1
      player = ComputerPlayer.new('X')
      board.player_move_at(player, user_input)
      board.player_undo_move_at(user_input)
      expect(board.grid[0].symbol).to eq(' ')
    end
  end
end
