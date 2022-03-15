require_relative './computer_player'
require_relative './human_player'
require_relative './game'
require_relative './UI'

# This will handle game setup choices for the user
class GameSetup
  attr_reader :ui, :player_one, :player_two, :game

  def initialize(ui = UI.new)
    @ui = ui
    @player_one = nil
    @player_two = nil
    @game = nil
  end


  def main_menu
    ui.welcome_message
    loop do
        ui.game_selection_prompt
        user_input = ui.get_menu_selection
        if user_input == 1
          human_vs_human
        elsif user_input == 2
          human_vs_computer
        elsif user_input == 3
            break
        end
        game_builder
        game.run_game_loop
    end
    ui.exit_message
  end

  def human_vs_human
    @player_one = HumanPlayer.new
    @player_two = HumanPlayer.new('O')
  end

  def human_vs_computer
    @player_one = HumanPlayer.new
    @player_two = ComputerPlayer.new
  end

  def game_builder
    new_game = Game.new(@player_one, @player_two)
    @game = new_game
  end

end