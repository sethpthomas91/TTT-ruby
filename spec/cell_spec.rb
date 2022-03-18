require_relative '../lib/cell'

describe 'Cell' do
  it 'should create a new cell that has a symbol of a blank string' do
    cell = Cell.new
    input = cell.symbol
    output = ' '
    expect(input).to eq(output)
  end
end

describe 'Cell.symbol?' do
  it 'should return false if it does not have a symbol that is X or O' do
    cell = Cell.new
    input = cell.symbol?
    output = false
    expect(input).to eq(output)
  end
end

describe 'Cell.symbol?' do
  it 'should return true if it does  have a symbol that is X' do
    cell = Cell.new
    cell.change_symbol_to('X')
    expect(cell.symbol?).to eq(true)
  end
end

describe 'Cell.symbol?' do
  it 'should return true if it does  have a symbol that is O' do
    cell = Cell.new
    cell.change_symbol_to('X')
    expect(cell.symbol?).to eq(true)
  end
end

describe 'Cell.change_symbol_to' do
  it 'should change the mark to whatever is placed in the argument' do
    cell = Cell.new
    cell.change_symbol_to('X')
    expect(cell.symbol).to eq('X')
  end
end
