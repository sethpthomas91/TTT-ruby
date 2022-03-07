require 'cell'

describe 'Cell' do
    it 'should create a new cell that has a symbol of a blank string' do
      cell = Cell.new
      input = cell.symbol
      output = ' '
      expect(input).to eq(output)
    end
  end

describe 'Cell.make_x' do
    it 'should change symbol to X' do
      cell = Cell.new
      cell.make_x
      input = cell.symbol
      output = 'X'
      expect(input).to eq(output)
    end
end

describe 'Cell.make_o' do
    it 'should change symbol to O' do
      cell = Cell.new
      cell.make_o
      input = cell.symbol
      output = 'O'
      expect(input).to eq(output)
    end
end

describe 'Cell.has_symbol' do
    it 'should return false if it does not have a symbol that is X or O' do
      cell = Cell.new
      input = cell.has_symbol
      output = false
      expect(input).to eq(output)
    end
end

describe 'Cell.has_symbol' do
    it 'should return true if it does  have a symbol that is X' do
      cell = Cell.new
      cell.make_x
      input = cell.has_symbol
      output = true
      expect(input).to eq(output)
    end
end

describe 'Cell.has_symbol' do
    it 'should return true if it does  have a symbol that is Y' do
      cell = Cell.new
      cell.make_o
      input = cell.has_symbol
      output = true
      expect(input).to eq(output)
    end
end
