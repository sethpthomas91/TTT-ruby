# frozen_string_literal: true

# this class will be an individual cell that will change based on user input
class Cell
  attr_reader :symbol, :grid_number

  def initialize
    @symbol = ' '
    @grid_number = ''
  end

  def change_grid_number(new_number)
    @grid_number = new_number
  end

  def symbol?
    @symbol != ' '
  end

  def game_display
    symbol? ? @symbol : @grid_number
  end

  def change_symbol_to(new_symbol)
    @symbol = new_symbol
  end
end
