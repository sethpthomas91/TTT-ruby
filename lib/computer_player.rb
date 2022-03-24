require_relative './player'
require_relative './game_logic'

# This will be the computer player and will hold move logic
class ComputerPlayer < Player
  attr_reader :is_unbeatable, :game_logic

  def initialize(marker = 'O', is_computer: true, is_unbeatable: false)
    @marker = marker
    @is_computer = is_computer
    @is_unbeatable = is_unbeatable
    @game_logic = GameLogic.new
  end

  def make_unbeatable
    @is_unbeatable = true
  end

  def random_move
    rand(1..9)
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
    end
    best_score
  end
end
