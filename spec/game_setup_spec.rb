require_relative '../lib/game_setup'
require_relative '../lib/computer_player'
require 'stringio'

RSpec.describe GameSetup do
  let(:game_setup) { GameSetup.new }

  describe '#human_vs_human' do
    it 'should generate player_one as a human player' do
      game_setup.human_vs_human_builder
      expect(game_setup.player_one.is_computer).to eq(false)
    end
  end

  describe '#human_vs_human' do
    it 'should generate player_two as a human player' do
      game_setup.human_vs_human_builder
      expect(game_setup.player_two.is_computer).to eq(false)
    end
  end

  describe '#return_user_input' do
    it 'should recieve user input and return that user input' do
      allow($stdin).to receive(:gets).and_return('1')
      something = $stdin.gets
      expect(something).to eq('1')
    end
  end

  describe '#set_unbeatable_computer' do
    it 'should set the computer player as unbeatable' do
      game_setup = GameSetup.new
      computer_player = ComputerPlayer.new
      game_setup.set_unbeatable_computer(computer_player)
      expect(computer_player.is_unbeatable).to eq(true)
    end
  end
end
