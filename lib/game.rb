# frozen_string_literal: true

require_relative './Board'
require_relative './UI'
require_relative './game_logic'
require_relative './computer_player'
require_relative './human_player'

# this class will wrap the board, UI together
class Game
  attr_reader :board, :ui, :game_logic

  def initialize(board = Board.new, ui = UI.new, game_logic = GameLogic.new)
    @board = board
    @ui = ui
    @game_logic = game_logic
    @player_one = HumanPlayer.new
    @player_two = HumanPlayer.new('O')
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

  def check_is_valid_move(user_input)
    valid_move = board.valid_move?(user_input)
    while valid_move == false
      ui.prompt_invalid_space
      user_input = ui.get_user_input
      valid_move = board.valid_move?(user_input)
    end
    user_input
  end

  def run_game_loop
    loop do
      ui.turn_start(board)
      user_input = ui.get_user_input
      user_input = check_is_valid_move(user_input)
      board.player_move_at(@player_one, user_input)
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
      board.player_move_at(@player_two, user_input)
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

  def exit_game
    ui.exit_message
  end
end
