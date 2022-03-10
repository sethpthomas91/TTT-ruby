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

  def fetch_cell(index)
    @grid[index]
  end

  def change_symbol_to_x_at(grid_index)
    @grid[grid_index].make_x
  end

  def change_symbol_to_o_at(grid_index)
    @grid[grid_index].make_o
  end

  def change_user_input_to_index(user_num_input)
    user_num_input.to_i - 1
  end

  def player_x_move(user_input)
    index = change_user_input_to_index(user_input)
    change_symbol_to_x_at(index)
  end

  def player_o_move(user_input)
    index = change_user_input_to_index(user_input)
    change_symbol_to_o_at(index)
  end

  def make_symbol_arr
    symbol_arr = []
    @grid.each do |cell|
      symbol_arr << cell.symbol
    end
    symbol_arr
  end

  def valid_move?(index)
    # cell = fetch_cell(index)
    # !(fetch_cell(index).has_symbol)
    # !cell.has_symbol
    !(@grid[index].has_symbol)
  end
end
