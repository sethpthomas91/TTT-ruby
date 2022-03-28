require_relative './board'
require_relative './UI'
require_relative './game_logic'

# this class will wrap the board, UI together
class Game
  attr_reader :board, :ui, :game_logic, :player_one, :player_two

  def initialize(player_one, player_two, board = Board.new, ui = UI.new, game_logic = GameLogic.new)
    @board = board
    @ui = ui
    @game_logic = game_logic
    @player_one = player_one
    @player_two = player_two
  end

  def check_is_valid_human_move(user_input)
    valid_move = board.valid_move?(user_input)
    while valid_move == false
      ui.prompt_invalid_space(user_input)
      user_input = ui.get_integer_between(1, 9)
      valid_move = board.valid_move?(user_input)
    end
    user_input
  end

  def run_game_loop
    loop do
      turn(board: board, player: player_one)
      break if end_move?(player_one) == true

      turn(board: board, player: player_two)
      break if end_move?(player_two) == true
    end
  end

  def turn(board:, player:)
    ui.turn_start(board, player)
    if player.is_computer == true
      user_input = player.move(board: board)
      ui.computer_turn_message
    else
      user_input = player.move(board: board)
    end
    board.player_move_at(player, user_input)
  end

  def end_move?(player)
    ui.clear_terminal_screen
    symbol_arr = board.make_symbol_arr
    if winning_play?(symbol_arr)
      ui.display_game_interface(board)
      ui.prompt_player_win(player)
      true
    elsif draw_play?(symbol_arr)
      ui.display_game_interface(board)
      ui.prompt_draw
      true
    else
      false
    end
  end

  def winning_play?(symbol_arr)
    game_logic.check_for_win(symbol_arr)
  end

  def draw_play?(symbol_arr)
    game_logic.draw?(symbol_arr)
  end
end
