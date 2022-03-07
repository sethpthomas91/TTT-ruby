require 'board'

describe 'Board' do
  it 'should create a new board that has nine (base one) objects' do
    board = Board.new
    input = board.grid.length
    output = 9
    expect(input).to eq(output)
  end
end

describe 'Board' do
  it 'should change a cell symbol at a specified grid to X' do
    board = Board.new
    board.change_symbol_to_x_at(0)
    input = board.grid[0].symbol
    output = 'X'
    expect(input).to eq(output)
  end
end

describe 'Board' do
    it 'should change a cell symbol at a specified grid to O' do
      board = Board.new
      board.change_symbol_to_o_at(0)
      input = board.grid[0].symbol
      output = 'O'
      expect(input).to eq(output)
    end
  end
