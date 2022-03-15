require_relative './board'
require_relative './UI'
require_relative './game_logic'
require_relative './computer_player'
require_relative './human_player'

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
      ui.prompt_invalid_space
      user_input = ui.get_user_input
      valid_move = board.valid_move?(user_input)
    end
    user_input
  end

  def check_is_valid_computer_move(computer_input)
    valid_move = board.valid_move?(computer_input)
    while valid_move == false
      computer_input = rand(1..9)
      valid_move = board.valid_move?(computer_input)
    end
    computer_input
  end

  def run_game_loop
    loop do
      turn(@player_one)
      break if winning_play?(@player_one) == true

      turn(@player_two)
      break if winning_play?(@player_two) == true
    end
  end

  def turn(player)
    ui.turn_start(board)
    if player.is_computer == true
      user_input = player.random_move
      user_input = check_is_valid_computer_move(user_input)
    else
      user_input = ui.get_user_input
      user_input = check_is_valid_human_move(user_input)
    end
    board.player_move_at(player, user_input)
  end

  def winning_play?(player)
    ui.clear_terminal_screen
    symbol_arr = board.make_symbol_arr
    if game_logic.check_for_win(symbol_arr)
      ui.display_game_interface(board)
      ui.prompt_player_win(player)
      true
    elsif game_logic.draw?(symbol_arr)
      ui.display_game_interface(board)
      ui.prompt_draw
      true
    else
      false
    end
  end
end
