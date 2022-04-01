require_relative './computer_player'
require_relative './game_logic'

# This will be the medium computer player and will hold move logic
class MediumComputerPlayer < ComputerPlayer

  def initialize(*args)
    # @marker = marker
    # @is_computer = is_computer
    # @is_unbeatable = is_unbeatable
    # @game_logic = GameLogic.new
    @turn_count = 0
    super
  end

  def move(board:)
    puts "#{best_move(board)}"
    puts "#{random_move(board.generate_available_moves)}"
    puts "#{board.generate_available_moves}"
    move = @turn_count % 2 == 0  ?  best_move(board) : random_move(board.generate_available_moves)
    @turn_count += 1
    return move
  end
end