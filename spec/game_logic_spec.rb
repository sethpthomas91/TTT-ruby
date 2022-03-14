# frozen_string_literal: true

require_relative '../lib/game_logic'

RSpec.describe GameLogic do
  let(:game_logic) { GameLogic.new }

  it 'should return false for a winning board' do
    expect(game_logic.winning_board).to eq(false)
  end

  describe '#check_for_horizontal_win' do
    it 'should return true when a player has won the game on the top line' do
      array = ['O', 'O', 'O', ' ', ' ', ' ', ' ', ' ', ' ']
      expect(game_logic.check_for_horizontal_win(array)).to eq(true)
    end
  end

  describe '#check_for_horizontal_win' do
    it 'should return false when no wins are present' do
      array = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
      expect(game_logic.check_for_horizontal_win(array)).to eq(false)
    end
  end

  describe '#check_for_horizontal_win' do
    it 'should return true when a player has won the game on the middle horizontal line' do
      array = [' ', ' ', ' ', 'O', 'O', 'O', ' ', ' ', ' ']
      expect(game_logic.check_for_horizontal_win(array)).to eq(true)
    end
  end

  describe '#check_for_horizontal_win' do
    it 'should return true when a player has won the game on the bottom horizontal' do
      array = [' ', ' ', ' ', ' ', ' ', ' ', 'O', 'O', 'O']
      expect(game_logic.check_for_horizontal_win(array)).to eq(true)
    end
  end

  describe '#check_for_vertical_win' do
    it 'should return true when a player has won the game on the left vertical line' do
      array = ['O', ' ', ' ', 'O', ' ', ' ', 'O', ' ', ' ']
      expect(game_logic.check_for_vertical_win(array)).to eq(true)
    end
  end

  describe '#check_for_vertical_win' do
    it 'should return true when a player has won the game on the middle vertical line' do
      array = [' ', 'O', ' ', ' ', 'O', ' ', ' ', 'O', ' ']
      expect(game_logic.check_for_vertical_win(array)).to eq(true)
    end
  end

  describe '#check_for_win' do
    it 'should return true when a winning condition is present' do
      array = [' ', 'O', ' ', ' ', 'O', ' ', ' ', 'O', ' ']
      expect(game_logic.check_for_win(array)).to eq(true)
    end
  end

  describe '#check_for_win' do
    it 'should return true when a winning condition is present' do
      array = [' ', ' ', ' ', ' ', 'O', ' ', ' ', 'O', ' ']
      expect(game_logic.check_for_win(array)).to eq(false)
    end
  end

  describe '#check_for_draw' do
    it 'should return false when no draw is present' do
      array = [' ', ' ', ' ', ' ', 'O', ' ', ' ', 'O', ' ']
      expect(game_logic.draw?(array)).to eq(false)
    end
  end

  describe '#check_for_draw' do
    it 'should return false when no draw is present' do
      array = %w[O X O O X O X O X]
      expect(game_logic.draw?(array)).to eq(true)
    end
  end
end
