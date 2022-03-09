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

  def display_grid_numbers
    puts ''
    puts "#{@grid[0].grid_number} | #{@grid[1].grid_number} | #{@grid[2].grid_number}"
    puts '--+---+--'
    puts "#{@grid[3].grid_number} | #{@grid[4].grid_number} | #{@grid[5].grid_number}"
    puts '--+---+--'
    puts "#{@grid[6].grid_number} | #{@grid[7].grid_number} | #{@grid[8].grid_number}"
    puts ''
  end

  def display_symbols
    puts ''
    puts "#{@grid[0].symbol} | #{@grid[1].symbol} | #{@grid[2].symbol}"
    puts '--+---+--'
    puts "#{@grid[3].symbol} | #{@grid[4].symbol} | #{@grid[5].symbol}"
    puts '--+---+--'
    puts "#{@grid[6].symbol} | #{@grid[7].symbol} | #{@grid[8].symbol}"
    puts ''
  end

  def display_game_interface
    puts ''
    puts "#{@grid[0].game_display} | #{@grid[1].game_display} | #{@grid[2].game_display}"
    puts '--+---+--'
    puts "#{@grid[3].game_display} | #{@grid[4].game_display} | #{@grid[5].game_display}"
    puts '--+---+--'
    puts "#{@grid[6].game_display} | #{@grid[7].game_display} | #{@grid[8].game_display}"
    puts ''
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

  def valid_move?(cell)
    !cell.has_symbol
  end

end
