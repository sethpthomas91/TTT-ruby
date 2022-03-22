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

  describe '#computer_difficulty_setter' do
    # Mocking/stubbing can be difficult to wrap your mind around.
    # Run the test and look over the below specs/notes.
    # docs:
    # https://relishapp.com/rspec/rspec-mocks/docs
    context 'user inputs 1' do
      it 'sets player to unbeatable' do
        player = ComputerPlayer.new
        allow_any_instance_of(UI).to receive(:prompt_set_unbeatable).with(player)
        allow_any_instance_of(UI).to receive(:binary_choice_input) { 1 }
        # `{ 1 }` at the end of the above line is an aliass for `and_return(1)`
        game_setup.computer_difficulty_setter(player)
        expect(player.is_unbeatable).to eq(true)
      end
      #   ABOVE ^^^^
      #   since the SUT (system under test) is not interacting
      #   directly with $stdin/$stdout you don't need to stub those,
      #   instead we can provide method stubs
      #   for the class that calls them, saying:
      #   "Hey UI, instead of behaving normally when
      #    AN INSTANCE OF YOUR CLASS receives the message
      #   `:prompt_set_unbeatable` with `player`, just
      #   ALLOW the message to be received but bypass the
      #   method/behavior. And when AN INSTANCE OF YOUR CLASS receives
      #   `:binary_choice_input` than return 1."

      # vvvv BELOW
      # Another way we can write this is using expect vs allow.
      # This makes the receiving of the message not just allowed but expected,
      # more like an assertion; meaning it will fail if the object with the
      # method stub doesn't receive the message whereas the allow syntax
      # would not cause a failure.
      it 'sets player to unbeatable (using expect vs. allow)' do
        player = ComputerPlayer.new
        expect_any_instance_of(UI).to receive(:prompt_set_unbeatable).with(player)
        expect_any_instance_of(UI).to receive(:binary_choice_input) { 1 }
        game_setup.computer_difficulty_setter(player)
        expect(player.is_unbeatable).to eq(true)
      end
    end

    context 'user inputs 2' do
      it 'sets player to beatable' do
        player = ComputerPlayer.new
        allow_any_instance_of(UI).to receive(:prompt_set_unbeatable).with(player)
        allow_any_instance_of(UI).to receive(:binary_choice_input) { 2 }
        game_setup.computer_difficulty_setter(player)
        expect(player.is_unbeatable).to eq(false)
      end
    end
  end

  # FAILING TEST BELOW
  # describe '#computer_difficulty_setter' do
  #   it 'should recieve user input and set player to ubeatable' do
  #     allow($stdin).to receive(:gets).and_return('1')
  #     player = ComputerPlayer.new
  #     allow(game_setup.computer_difficulty_setter(player)).to receive($stdin) { '1' }
  #     expect(player.is_unbeatable).to eq(true)
  #   end
  # end
  # FAILING TEST ABOVE

  describe '#set_unbeatable_computer' do
    it 'should set the computer player as unbeatable' do
      game_setup = GameSetup.new
      computer_player = ComputerPlayer.new
      game_setup.set_unbeatable_computer(computer_player)
      expect(computer_player.is_unbeatable).to eq(true)
    end
  end
end
