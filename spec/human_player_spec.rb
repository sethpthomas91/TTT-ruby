require_relative '../lib/human_player'

RSpec.describe HumanPlayer do
  let(:human_player) { HumanPlayer.new }

  describe '#marker' do
    it 'should return an X' do
      expect(human_player.marker).to eq('X')
    end
  end

  describe '#assign_marker_as' do
    it 'should return an X' do
      expect(human_player.assign_marker_as('O')).to eq('O')
    end
  end
end
