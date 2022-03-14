# frozen_string_literal: true

class HumanPlayer
  attr_reader :marker, :is_computer

  def initialize(marker = 'X', is_computer = false)
    @marker = marker
    @is_computer = is_computer
  end

  def assign_marker_as(new_marker)
    @marker = new_marker
  end
end
