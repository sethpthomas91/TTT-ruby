# frozen_string_literal: true

require_relative '../lib/board'

RSpec.describe Board do
  let(:board) { Board.new }

  it 'should create a new board that has nine (base one) objects' do
    expect(board.grid.length).to eq(9)
    # avoid input vs output, use the actual arguments/functions in these
  end

  describe '#change_symbol_to_x_at' do
    it 'should change a cell symbol at a specified grid to X' do
      board.change_symbol_to_x_at(0)
      input = board.grid[0].symbol
      output = 'X'
      expect(input).to eq(output)
    end
  end

  describe '#change_symbol_to_o_at' do
    it 'should change a cell symbol at a specified grid to O' do
      board.change_symbol_to_o_at(0)
      input = board.grid[0].symbol
      output = 'O'
      expect(input).to eq(output)
    end
  end

  describe '#make_symbol_arr' do
    it 'should return a correct symbol array' do
      board.change_symbol_to_o_at(0)
      board.change_symbol_to_o_at(1)
      board.change_symbol_to_o_at(2)
      input = board.make_symbol_arr
      output = ['O', 'O', 'O', ' ', ' ', ' ', ' ', ' ', ' ']
      expect(input).to eq(output)
    end
  end

  describe '#check_for_horizontal_win' do
    it 'should return true when a player has won the game on the top line' do
      board.change_symbol_to_o_at(0)
      board.change_symbol_to_o_at(1)
      board.change_symbol_to_o_at(2)
      symbol_arr = board.make_symbol_arr
      input = board.check_for_horizontal_win(symbol_arr)
      output = true
      expect(input).to eq(output)
    end
  end

  describe '#check_for_horizontal_win' do
    it 'should return true when a player has won the game on the middle horizontal line' do
      board.change_symbol_to_o_at(3)
      board.change_symbol_to_o_at(4)
      board.change_symbol_to_o_at(5)
      symbol_arr = board.make_symbol_arr
      input = board.check_for_horizontal_win(symbol_arr)
      output = true
      expect(input).to eq(output)
    end
  end

  describe '#check_for_horizontal_win' do
    it 'should return true when a player has won the game on the bottom horizontal line' do
      board.change_symbol_to_o_at(6)
      board.change_symbol_to_o_at(7)
      board.change_symbol_to_o_at(8)
      symbol_arr = board.make_symbol_arr
      input = board.check_for_horizontal_win(symbol_arr)
      output = true
      expect(input).to eq(output)
    end
  end

  describe '#check_for_vertical_win' do
    it 'should return true when a player has won the game on the left vertical line' do
      board.change_symbol_to_o_at(0)
      board.change_symbol_to_o_at(3)
      board.change_symbol_to_o_at(6)
      symbol_arr = board.make_symbol_arr
      input = board.check_for_vertical_win(symbol_arr)
      output = true
      expect(input).to eq(output)
    end
  end

  describe '#check_for_vertical_win' do
    it 'should return true when a player has won the game on the middle vertical line' do
      board.change_symbol_to_o_at(1)
      board.change_symbol_to_o_at(4)
      board.change_symbol_to_o_at(7)
      symbol_arr = board.make_symbol_arr
      input = board.check_for_vertical_win(symbol_arr)
      output = true
      expect(input).to eq(output)
    end
  end

  describe '#check_for_vertical_win' do
    it 'should return true when a player has won the game on the right vertical line' do
      board.change_symbol_to_o_at(2)
      board.change_symbol_to_o_at(5)
      board.change_symbol_to_o_at(8)
      symbol_arr = board.make_symbol_arr
      input = board.check_for_vertical_win(symbol_arr)
      output = true
      expect(input).to eq(output)
    end
  end

  describe '#valid_move?' do
    it 'should return false when a cell has already been played' do
      board.change_symbol_to_o_at(2)
      input = board.valid_move?(board.grid[2])
      output = false
      expect(input).to eq(output)
    end
  end

  describe '#valid_move?' do
    it 'should return true when a cell has not been played' do
      board.change_symbol_to_o_at(1)
      expect(board.valid_move?(board.grid[2])).to eq(true)
    end
  end

  describe '#check_for_win' do
    it 'should return false when no winning combination is present' do
      input = board.check_for_win
      output = false
      expect(input).to eq(output)
    end
  end

  describe '#check_for_win' do
    it 'should return true when winning combination is present' do
      board.change_symbol_to_o_at(1)
      board.change_symbol_to_o_at(4)
      board.change_symbol_to_o_at(7)
      input = board.check_for_win
      output = true
      expect(input).to eq(output)
    end
  end

  describe '#check_for_win' do
    it 'should return false when there is no draw' do
      input = board.check_for_draw([])
      output = false
      expect(input).to eq(output)
    end
  end

  describe '#check_for_draw' do
    it 'should return true when there is a draw' do
      board.change_symbol_to_o_at(0)
      board.change_symbol_to_x_at(1)
      board.change_symbol_to_o_at(2)
      board.change_symbol_to_o_at(3)
      board.change_symbol_to_x_at(4)
      board.change_symbol_to_o_at(5)
      board.change_symbol_to_x_at(6)
      board.change_symbol_to_o_at(7)
      board.change_symbol_to_x_at(8)

      expect(board.check_for_draw).to eq(true)
    end
  end
end
