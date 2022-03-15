# frozen_string_literal: true

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
      input = board.make_symbol_arr
      output = ['O', 'O', 'O', ' ', ' ', ' ', ' ', ' ', ' ']
      expect(input).to eq(output)
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
end
