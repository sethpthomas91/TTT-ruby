# frozen_string_literal: true

require_relative './cell'

# Class that will hold all of the cells
class Board
  attr_reader :grid

  def initialize
    @grid = create_blank_grid
  end

  def create_blank_grid
    blank_grid = []
    cell_number = 1
    until blank_grid.length == 9
      new_cell = Cell.new
      new_cell.change_grid_number(cell_number)
      blank_grid << new_cell
      cell_number += 1
    end
    blank_grid
  end

  def fetch_cell(user_input)
    index = user_input - 1
    @grid[index]
  end

  def change_user_input_to_index(user_num_input)
    user_num_input.to_i - 1
  end

  def make_symbol_arr
    symbol_arr = []
    @grid.each do |cell|
      symbol_arr << cell.symbol
    end
    symbol_arr
  end

  def valid_move?(user_input)
    index = user_input - 1
    !@grid[index].symbol?
  end

  def player_move_at(player, user_input)
    grid_index = change_user_input_to_index(user_input)
    player_marker = player.marker
    @grid[grid_index].change_symbol_to(player_marker)
  end
end
