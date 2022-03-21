# This will be the computer player and will hold move logic
class ComputerPlayer
  attr_reader :is_computer, :marker, :is_unbeatable

  def initialize(marker = 'O', is_computer: true, is_unbeatable: false)
    @marker = marker
    @is_computer = is_computer
    @is_unbeatable = is_unbeatable
  end

  def make_unbeatable
    @is_unbeatable = true
  end

  def random_move
    rand(1..9)
  end

  def assign_marker_as(new_marker)
    @marker = new_marker
  end
end
