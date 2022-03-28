require_relative './player'

class HumanPlayer < Player
  def initialize(marker = 'X', is_computer: false)
    @marker = marker
    @is_computer = is_computer
  end
end
