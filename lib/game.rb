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
    # enter the game loop
    while true

      play_x_turn
      ui.display_game_interface(board)
      if game_logic.check_for_win(board.make_symbol_arr)
        ui.player_x_win(board)
        break
      elsif game_logic.check_for_draw(board.make_symbol_arr)
        ui.prompt_draw
        break
      end
      # ui.clear_terminal_screen


      play_o_turn
      ui.display_game_interface(board)
      if game_logic.check_for_win(board.make_symbol_arr)
        ui.player_o_win(board)
        break
      elsif game_logic.check_for_draw(board.make_symbol_arr)
        ui.prompt_draw
        break
      end
      # ui.clear_terminal_screen
    end
  end
  # stuck on the loop letting invalid spaces still being called and approved
  def play_x_turn
    ui.turn_start(board)
    valid_move = false
    while true
      user_input = ui.get_user_input
      puts "Fetched X cell:", board.fetch_cell(user_input).symbol, "!"
      if board.valid_move?(user_input)
        break
      end
      ui.prompt_invalid_space
    end
    board.player_x_move(user_input)
  end

  def play_o_turn
    ui.turn_start(board)
    valid_move = false
    while true
      user_input = ui.get_user_input
      puts "Fetched O cell:", board.fetch_cell(user_input).symbol, "!"
      if board.valid_move?(user_input)
        break
      end
      ui.prompt_invalid_space
    end
    board.player_o_move(user_input)
  end

  

  def exit_game
    ui.exit_message
  end
end
