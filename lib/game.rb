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
    loop do
      ui.turn_start(board)
      user_input = ui.get_user_input
      user_input = check_is_valid_move(user_input)
      board.player_x_move(user_input)
      symbol_arr = board.make_symbol_arr
      if game_logic.check_for_win(symbol_arr)
        ui.prompt_x_win
        break
      elsif game_logic.draw?(symbol_arr)
        ui.prompt_draw
        break
      end
      ui.clear_terminal_screen

      ui.turn_start(board)
      user_input = ui.get_user_input
      user_input = check_is_valid_move(user_input)
      board.player_o_move(user_input)
      symbol_arr = board.make_symbol_arr
      if game_logic.check_for_win(symbol_arr)
        ui.prompt_o_win
        break
      elsif game_logic.draw?(symbol_arr)
        ui.prompt_draw
        break
      end
      ui.clear_terminal_screen
    end
  end

  def check_is_valid_move(user_input)
    valid_move = board.valid_move?(user_input)
    while valid_move == false
      ui.prompt_invalid_space
      user_input = ui.get_user_input
      valid_move = board.valid_move?(user_input)
    end
    return user_input
  end

  def exit_game
    ui.exit_message
  end
end
