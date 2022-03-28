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

  def random_move(moves_left)
    moves_left.sample
  end

  def move(board:)
    is_unbeatable ? best_move(board) : random_move(board.generate_available_moves)
  end

  def best_move(board)
    maximizing_player = self
    minimizing_player = ComputerPlayer.new
    marker == 'X' ? minimizing_player.assign_marker_as('O') : minimizing_player.assign_marker_as('X')
    best_score = -Float::INFINITY
    move = nil
    available_moves = board.generate_available_moves
    available_moves.each do | next_move |
      board.player_move_at(maximizing_player, next_move)
      score = minimax(board, false, maximizing_player, minimizing_player)
      board.player_undo_move_at(next_move)
      next unless score > best_score

      best_score = score
      move = next_move
      puts "Better score found #{best_score} at #{move}"
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
      best_score = -Float::INFINITY
      available_moves = current_board.generate_available_moves
      available_moves.each do | next_move |
        current_board.player_move_at(maximizing_player, next_move)
        score = minimax(current_board, false, maximizing_player, minimizing_player)
        current_board.player_undo_move_at(next_move)
        best_score = [score, best_score].max
      end
    else
      best_score = Float::INFINITY
      available_moves = current_board.generate_available_moves
      available_moves.each do | next_move |
        current_board.player_move_at(minimizing_player, next_move)
        score = minimax(current_board, true, maximizing_player, minimizing_player)
        current_board.player_undo_move_at(next_move)
        best_score = [score, best_score].min
      end 
    end
    best_score
  end

  def computer_thinking_message
    thinking_messages = [
      "\nThinking...",
      "\nHmmmmmmm...",
      "\nClever move...",
      "\nThis is my game!",
      "\nWait...."
    ]
    puts thinking_messages[rand(5)]
  end

  def computer_delay
    sleep(rand(0..1))
  end

  def turn_message
    computer_thinking_message
    computer_delay
  end
end
