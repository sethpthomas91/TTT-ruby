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

  def make_x
    @symbol = 'X'
  end
  
  def make_o
    @symbol = 'O'
  end

  def has_symbol
    if @symbol === ' '
      return false
    else 
      return true
    end
  end

  def game_display
    self.has_symbol ? @symbol : @grid_number
  end
  
end