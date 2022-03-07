require 'board'

describe 'Board' do
  it 'should create a new board that is empty' do
    board = Board.new
    expect(board.is_empty).to eq(true)
  end
end
