require_relative '../lib/computer_player'

RSpec.describe ComputerPlayer do
  let(:computer_player) { ComputerPlayer.new }

  describe '#random_move' do
    it 'should return a random integer between 1-9' do
      expect(computer_player.random_move).to be_between(1, 9)
    end
  end
end