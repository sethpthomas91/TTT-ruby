require_relative '../lib/game_setup'

RSpec.describe GameSetup do
  let(:game_setup) { GameSetup.new }

  describe '#human_vs_human' do
    it 'should generate player_one as a human player' do
      game_setup.human_vs_human
      expect(game_setup.player_one.is_computer).to eq(false)
    end
  end

  describe '#human_vs_human' do
    it 'should generate player_two as a human player' do
      game_setup.human_vs_human
      expect(game_setup.player_two.is_computer).to eq(false)
    end
  end

  describe '#human_vs_computer' do
    it 'should generate player_one as a human player' do
      game_setup.human_vs_computer
      expect(game_setup.player_one.is_computer).to eq(false)
    end
  end

  describe '#human_vs_computer' do
    it 'should generate player_two as a computer player' do
      game_setup.human_vs_computer
      expect(game_setup.player_two.is_computer).to eq(true)
    end
  end
end
