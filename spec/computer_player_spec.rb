require_relative '../lib/computer_player'

RSpec.describe ComputerPlayer do
  let(:computer_player) { ComputerPlayer.new }

  describe '#random_move' do
    it 'should return a random integer between 1-9' do
      expect(computer_player.random_move).to be_between(1, 9)
    end
  end

  describe '#marker' do
    it 'should return an O' do
      expect(computer_player.marker).to eq('O')
    end
  end

  describe '#assign_marker_as' do
    it 'should return an X' do
      expect(computer_player.assign_marker_as('X')).to eq('X')
    end
  end
  
end