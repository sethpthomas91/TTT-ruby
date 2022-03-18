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

  describe '#get_menu_selection' do
    it 'should allow a valid number between 1-3' do
      ui.stub(gets: '1')
      expect(ui.get_user_input).to eq(1)
    end
  end

  describe '#get_human_play_first_input' do
    it 'should accept 1 as a valid input' do
      ui.stub(gets: '1')
      expect(ui.get_human_play_first_input).to eq(1)
    end
  end

  describe '#get_human_play_first_input' do
    it 'should accept 1 as a valid input' do
      ui.stub(gets: '1')
      expect(ui.get_human_play_first_input).not_to eq(4)
    end
  end

  describe '#get_human_play_first_input' do
    it 'should accept 1 as a valid input' do
      ui.stub(gets: '2')
      expect(ui.get_human_play_first_input).to eq(2)
    end
  end
end
