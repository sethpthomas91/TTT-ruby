# frozen_string_literal: true

require 'board'

describe 'Board' do
  it 'should create a new board that has nine (base one) objects' do
    board = Board.new
    input = board.grid.length
    output = 9
    expect(input).to eq(output)
  end
end

describe 'Board.change_symbol_to_x_at' do
  it 'should change a cell symbol at a specified grid to X' do
    board = Board.new
    board.change_symbol_to_x_at(0)
    input = board.grid[0].symbol
    output = 'X'
    expect(input).to eq(output)
  end
end

describe 'Board.change_symbol_to_o_at' do
  it 'should change a cell symbol at a specified grid to O' do
    board = Board.new
    board.change_symbol_to_o_at(0)
    input = board.grid[0].symbol
    output = 'O'
    expect(input).to eq(output)
  end
end

describe 'Board.has_winner' do
  it 'should create a new board with no winner' do
    board = Board.new
    input = board.has_winner
    output = false
    expect(input).to eq(output)
  end
end

describe 'Board.make_symbol_arr' do
  it 'should return a correct symbol array' do
    board = Board.new
    board.change_symbol_to_o_at(0)
    board.change_symbol_to_o_at(1)
    board.change_symbol_to_o_at(2)
    input = board.make_symbol_arr
    output = ['O', 'O', 'O', ' ', ' ', ' ', ' ', ' ', ' ']
    expect(input).to eq(output)
  end
end

describe 'Board.check_for_horizontal_win' do
  it 'should return true when a player has won the game on the top line' do
    board = Board.new
    board.change_symbol_to_o_at(0)
    board.change_symbol_to_o_at(1)
    board.change_symbol_to_o_at(2)
    input = board.check_for_horizontal_win
    output = true
    expect(input).to eq(output)
  end
end

describe 'Board.check_for_horizontal_win' do
  it 'should return true when a player has won the game on the middle horizontal line' do
    board = Board.new
    board.change_symbol_to_o_at(3)
    board.change_symbol_to_o_at(4)
    board.change_symbol_to_o_at(5)
    input = board.check_for_horizontal_win
    output = true
    expect(input).to eq(output)
  end
end

describe 'Board.check_for_horizontal_win' do
  it 'should return true when a player has won the game on the bottom horizontal line' do
    board = Board.new
    board.change_symbol_to_o_at(6)
    board.change_symbol_to_o_at(7)
    board.change_symbol_to_o_at(8)
    input = board.check_for_horizontal_win
    output = true
    expect(input).to eq(output)
  end
end

describe 'Board.check_for_vertical_win' do
  it 'should return true when a player has won the game on the left vertical line' do
    board = Board.new
    board.change_symbol_to_o_at(0)
    board.change_symbol_to_o_at(3)
    board.change_symbol_to_o_at(6)
    input = board.check_for_vertical_win
    output = true
    expect(input).to eq(output)
  end
end

describe 'Board.check_for_vertical_win' do
  it 'should return true when a player has won the game on the middle vertical line' do
    board = Board.new
    board.change_symbol_to_o_at(1)
    board.change_symbol_to_o_at(4)
    board.change_symbol_to_o_at(7)
    input = board.check_for_vertical_win
    output = true
    expect(input).to eq(output)
  end
end

describe 'Board.check_for_vertical_win' do
  it 'should return true when a player has won the game on the right vertical line' do
    board = Board.new
    board.change_symbol_to_o_at(2)
    board.change_symbol_to_o_at(5)
    board.change_symbol_to_o_at(8)
    input = board.check_for_vertical_win
    output = true
    expect(input).to eq(output)
  end
end
