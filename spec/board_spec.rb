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
      expect(board.grid[0].symbol).to eq('X')
    end
  end

  describe '#change_symbol_to_o_at' do
    it 'should change a cell symbol at a specified grid to O' do
      board.change_symbol_to_o_at(0)
      expect(board.grid[0].symbol).to eq('O')
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

  describe '#valid_move?' do
    it 'should return false when an index has already been played' do
      board.change_symbol_to_o_at(2)
      expect(board.valid_move?(2)).to eq(false)
    end
  end

  describe '#valid_move?' do
    it 'should return true when a cell has not been played' do
      board.change_symbol_to_o_at(1)
      expect(board.valid_move?(2)).to eq(true)
    end
  end

end
