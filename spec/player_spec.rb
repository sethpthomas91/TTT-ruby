require_relative '../lib/player'

RSpec.describe Player do
    let(:player) { Player.new }
    
    describe '#assign_marker_as' do
      context 'X is passed in'
      it 'should return an X' do
        expect(player.assign_marker_as('X')).to eq('X')
      end
    end
  end