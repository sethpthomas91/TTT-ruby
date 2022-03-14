# frozen_string_literal: true

class ComputerPlayer
  attr_reader :marker

  def initialize(marker = 'O')
    @marker = marker
  end

  def random_move
    rand(1..9)
  end

  def assign_marker_as(new_marker)
    marker = new_marker
  end
end
