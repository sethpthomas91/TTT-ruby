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
    ui.clear_terminal_screen
    ui.welcome_message
    loop do
      ui.game_selection_prompt
      user_input = ui.return_choice_integer_between(1, 4)
      case user_input
      when 1
        human_vs_human_builder
      when 2
        human_vs_computer
      when 3
        computer_vs_computer_builder
      when 4
        break
      end
      ui.clear_terminal_screen
      game_builder
      game.run_game_loop
    end
    ui.exit_message
  end

  def human_vs_human_builder
    @player_one = HumanPlayer.new
    @player_two = HumanPlayer.new('O')
  end

  def return_user_input
    gets.chomp
  end

  def human_vs_computer_builder
    @player_one = HumanPlayer.new
    @player_two = ComputerPlayer.new
    computer_difficulty_setter(@player_two)
  end

  def computer_vs_computer_builder
    @player_one = ComputerPlayer.new('X')
    computer_difficulty_setter(@player_one)
    @player_two = ComputerPlayer.new
    computer_difficulty_setter(@player_two)
  end

  def computer_vs_human_builder
    @player_one = ComputerPlayer.new('X')
    computer_difficulty_setter(@player_one)
    @player_two = HumanPlayer.new('O')
  end

  def human_vs_computer
    ui.clear_terminal_screen
    ui.prompt_play_first_question
    user_input = ui.return_choice_integer_between(1, 2)
    if user_input == 1
      human_vs_computer_builder
    else
      computer_vs_human_builder
    end
  end

  def set_unbeatable_computer(player)
    player.make_unbeatable
  end

  def computer_difficulty_setter(player)
    loop do
      ui.prompt_set_unbeatable(player)
      user_input = ui.return_choice_integer_between(1, 2)
      case user_input
      when 1
        set_unbeatable_computer(player)
        break
      when 2
        break
      end
    end
  end

  def game_builder
    new_game = Game.new(@player_one, @player_two)
    @game = new_game
  end
end
