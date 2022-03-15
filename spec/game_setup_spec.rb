require_relative '../lib/game_setup'

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

  describe '#human_vs_computer_builder' do
    it 'should build set the second player' do
      game_setup.human_vs_computer_builder
      expect(game_setup.player_two.is_computer).to eq(true)
    end
  end

  describe '#human_vs_computer' do
    it 'should build set the second player as a computer when given 1' do
      game_setup.stub(gets: '1')
      game_setup.human_vs_computer_builder
      expect(game_setup.player_two.is_computer).to eq(true)
    end
  end

  # describe '#human_vs_computer' do
  #   it 'should build set the second player as a human when given 2' do
  #     game_setup.stub(gets: '2')
  #     game_setup.human_vs_computer_builder
  #     expect(game_setup.player_two.is_computer).to eq(false)
  #   end
  # end

end
