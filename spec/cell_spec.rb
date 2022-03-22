require_relative '../lib/cell'

RSpec.describe Cell do
  let(:cell) { Cell.new}

  it 'should create a new cell that has a symbol of a blank string' do
    expect(cell.symbol).to eq(' ')
  end

  describe '#symbol?' do
    it 'should return false if it does not have a symbol that is X or O' do
      expect(cell.symbol?).to eq(false)
    end
  end

  describe '#symbol?' do
    it 'should return true if it does  have a symbol that is X' do
      cell.change_symbol_to('X')
      expect(cell.symbol?).to eq(true)
    end
  end

  describe '#symbol?' do
    it 'should return true if it does  have a symbol that is O' do
      cell.change_symbol_to('O')
      expect(cell.symbol?).to eq(true)
    end
  end

  describe '#change_symbol_to?' do
    it 'should return true if it does  have a symbol that is O' do
      cell.change_symbol_to('Q')
      expect(cell.symbol).to eq('Q')
    end
  end

end
