require_relative '../lib/game'
require_relative '../lib/human_player'

RSpec.describe Game do
  let(:game) { Game.new(player_one = HumanPlayer.new, player_two = HumanPlayer.new) }

  describe '#check_is_valid_human_move' do
    it 'should allow a user to play in a valid space' do
      expect(game.check_is_valid_human_move(1)).to eq(1)
    end
  end

  describe '#check_is_valid_computer_move' do
    it 'should allow a user to play in a valid space' do
      expect(game.check_is_valid_computer_move(1)).to eq(1)
    end
  end

  describe '#end_move?' do
    it 'should return false if the board does not have an end condition' do
      expect(game.end_move?(game.player_one)).to eq(false)
    end
  end

  describe '#winning_play?' do
    it 'should return false if the board does not have a winner' do
      symbol_arr = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
      expect(game.winning_play?(symbol_arr)).to eq(false)
    end
  end

  describe '#winning_play?' do
    it 'should return true if the board does have a winner' do
      symbol_arr = ['X', 'X', 'X', ' ', ' ', ' ', ' ', ' ', ' ']
      expect(game.winning_play?(symbol_arr)).to eq(true)
    end
  end

  describe '#draw_play?' do
    it 'should return false if the board does have a draw' do
      symbol_arr = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
      expect(game.draw_play?(symbol_arr)).to eq(false)
    end
  end

  describe '#draw_play?' do
    it 'should return false if the board does have a draw' do
      symbol_arr = %w[X O X O X O X O X]
      expect(game.draw_play?(symbol_arr)).to eq(true)
    end
  end
end
