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
      turn(@player_one, @player_two)
      break if end_move?(@player_one) == true

      turn(@player_two, @player_one)
      break if end_move?(@player_two) == true
    end
  end

  def turn(player, other_player)
    ui.turn_start(board)
    if player.is_computer == true
      if player.is_unbeatable
        user_input = best_move(board, player, other_player)
      elsif player.is_unbeatable == false
        user_input = player.random_move
        user_input = check_is_valid_computer_move(user_input)
      end
      ui.computer_turn_message
    else
      user_input = ui.get_user_input
      user_input = check_is_valid_human_move(user_input)
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

  def best_move(board, maximizing_player, minimizing_player)
    best_score = -100
    move = nil
    board.grid.each do |cell|
      next if cell.symbol?

      cell_number = cell.grid_number
      board.player_move_at(maximizing_player, cell_number)
      score = minimax(board, false, maximizing_player, minimizing_player)
      board.player_undo_move_at(cell_number)
      next unless score > best_score

      best_score = score
      move = cell_number
    end
    move
  end

  def minimax(current_board, is_maximizing, maximizing_player, minimizing_player)
    symbol_arr = current_board.make_symbol_arr
    if game_logic.return_winner_symbol(symbol_arr) == minimizing_player.marker
      return -10
    elsif game_logic.return_winner_symbol(symbol_arr) == maximizing_player.marker
      return 10
    elsif game_logic.draw?(symbol_arr)
      return 0
    end

    if is_maximizing
      best_score = -100
      current_board.grid.each do |cell|
        next if cell.symbol?

        cell_number = cell.grid_number
        current_board.player_move_at(maximizing_player, cell_number)
        score = minimax(current_board, false, maximizing_player, minimizing_player)
        current_board.player_undo_move_at(cell_number)
        best_score = [score, best_score].max
      end
      best_score
    else
      best_score = 100
      current_board.grid.each do |cell|
        next if cell.symbol?

        cell_number = cell.grid_number
        current_board.player_move_at(minimizing_player, cell_number)
        score = minimax(current_board, true, maximizing_player, minimizing_player)
        current_board.player_undo_move_at(cell_number)
        best_score = [score, best_score].min
      end
      best_score
    end
  end
end
