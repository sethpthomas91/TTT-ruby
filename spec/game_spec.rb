require_relative '../lib/game'

RSpec.describe Game do
  let(:game) { Game.new }

  describe '#human_vs_human' do
    it 'should generate player_one as a human player' do
      game_setup.human_vs_human
      expect(game_setup.player_one.is_computer).to eq(false)
    end
  end
end
