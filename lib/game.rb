# frozen_string_literal: true

require_relative './Board'
require_relative './UI'

# this class will wrap the board, UI, and players together
class Game

  def initialize
    @board = start_new_game
  end

  def start_new_game 
    Board.new
  end
  
end