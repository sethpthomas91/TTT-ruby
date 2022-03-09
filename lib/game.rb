# frozen_string_literal: true

require_relative './Board'
require_relative './UI'

# this class will wrap the board, UI together
class Game
  attr_reader :board, :ui

  def initialize
    @board = create_new_board
    @ui = create_new_UI
  end

  def create_new_board
    Board.new
  end

  def create_new_UI
    UI.new
  end

  def welcome_user
    ui.clear_terminal_screen
    ui.welcome_message
    ui.play_instructions
  end

  def run_game_loop
    winner = false
    while winner == false
      board.display_game_interface
      ui.prompt_for_turn
      user_input = gets.chomp
      board.player_x_move(user_input)
      if board.check_for_win
        ui.prompt_x_win
        break
      elsif board.check_for_draw
        ui.prompt_draw
        break
      end
      ui.clear_terminal_screen

      board.display_game_interface
      ui.prompt_for_turn
      user_input = gets.chomp
      board.player_o_move(user_input)
      if board.check_for_win
        ui.prompt_o_win
        break
      elsif board.check_for_draw
        ui.prompt_draw
        break
      end
      ui.clear_terminal_screen
    end
  end

  def exit_game
    ui.exit_message
  end
end
