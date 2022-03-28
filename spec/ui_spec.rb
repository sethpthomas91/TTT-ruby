require_relative '../lib/UI'
require_relative '../lib/board'

RSpec.describe UI do
  let(:ui) { UI.new }

  describe '#prompt_invalid_menu_selection' do
    it "should display 'Please select a valid option' to the terminal" do
      expect { ui.prompt_invalid_menu_selection }.to output("Please select a valid option\n").to_stdout
    end
  end

  describe '#display_game_interface' do
    it 'should display a board with only numbers to the terminal' do
      board = Board.new
      expect do
        ui.display_game_interface(board)
      end.to output("\n1 | 2 | 3\n--+---+--\n4 | 5 | 6\n--+---+--\n7 | 8 | 9\n\n").to_stdout
    end
  end

  describe '#get_integer_between' do
    context 'user inputs 1' do
      it 'should return an integer of 1' do
        expect_any_instance_of(UI).to receive(:get_input) { 1 }
        expect(ui.get_integer_between(1, 9)).to eq(1)
      end
    end

    context 'user inputs 1' do
      it 'should not return an integer of 2' do
        expect_any_instance_of(UI).to receive(:get_input) { 1 }
        expect(ui.get_integer_between(1, 9)).not_to eq(2)
      end
    end

    context 'receives a range of invalid inputs, but only returns the valid input' do
      it 'should not return an integer of 2' do
        expect_any_instance_of(UI).to receive(:get_input) { 0 }
        expect_any_instance_of(UI).to receive(:get_input) { -3 }
        expect_any_instance_of(UI).to receive(:get_input) { "hello" }
        expect_any_instance_of(UI).to receive(:get_input) { 5 }
        expect(ui.get_integer_between(1, 9)).to eq(5)
      end
    end
  end
end
