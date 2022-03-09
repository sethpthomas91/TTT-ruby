# frozen_string_literal: true

require_relative './Board'
require_relative './UI'
require_relative './game_logic'

# this class will wrap the board, UI together
class Game
  attr_reader :board, :ui, :game_logic

  def initialize
    @board = create_new_board
    @ui = create_new_ui
    @game_logic = create_game_logic
  end

  def create_new_board
    Board.new
  end

  def create_new_ui
    UI.new
  end

  def create_game_logic
    GameLogic.new
  end

  def welcome_user
    ui.clear_terminal_screen
    ui.welcome_message
    ui.play_instructions
  end

  def run_game_loop
    while game_logic.winning_board == false && game_logic.draw_board == false
      ui.turn_start(board)
      user_input = ui.get_user_input
      board.player_x_move(user_input)
      if game_logic.check_for_win(board.make_symbol_arr)
        ui.player_x_win(board)
        break
      elsif game_logic.check_for_draw(board.make_symbol_arr)
        ui.prompt_draw
        break
      end
      ui.clear_terminal_screen

      ui.turn_start(board)
      user_input = ui.get_user_input
      board.player_o_move(user_input)
      if game_logic.check_for_win(board.make_symbol_arr)
        ui.prompt_o_win
        break
      elsif game_logic.check_for_draw(board.make_symbol_arr)
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
