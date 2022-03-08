# frozen_string_literal: true

# Class that will hold all of the cells that players will change
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

  def check_for_horizontal_win(symbol_arr)
    if (symbol_arr[0] != ' ') && arr_all_same(symbol_arr[0, 3])
      true
    elsif (symbol_arr[3] != ' ') && arr_all_same(symbol_arr[3, 3])
      true
    elsif (symbol_arr[6] != ' ') && arr_all_same(symbol_arr[6, 3])
      true
    else
      false
    end
  end

  def arr_all_same(arr)
    arr.uniq.count <= 1
  end

  def check_for_vertical_win(symbol_arr)
    # this is bad code. Lots of repeat
    left_vert_arr = [symbol_arr[0], symbol_arr[3], symbol_arr[6]]
    mid_vert_arr = [symbol_arr[1], symbol_arr[4], symbol_arr[7]]
    right_vert_arr = [symbol_arr[2], symbol_arr[5], symbol_arr[8]]

    if (symbol_arr[0] != ' ') && arr_all_same(left_vert_arr)
      true
    elsif (symbol_arr[1] != ' ') && arr_all_same(mid_vert_arr)
      true
    elsif (symbol_arr[2] != ' ') && arr_all_same(right_vert_arr)
      true
    else
      false
    end
  end

  def check_for_diagonal_win(symbol_arr)
    top_left_to_bottom_arr = [symbol_arr[0], symbol_arr[4], symbol_arr[8]]
    top_right_to_bottom_arr = [symbol_arr[2], symbol_arr[4], symbol_arr[6]]

    if (top_left_to_bottom_arr[0] != ' ') && arr_all_same(top_left_to_bottom_arr)
      true
    elsif (top_right_to_bottom_arr[0] != ' ') && arr_all_same(top_right_to_bottom_arr)
      true
    else
      false
    end
  end

  def valid_move?(cell)
    !cell.has_symbol
  end

  def check_for_win
    symbol_arr = make_symbol_arr
    if check_for_diagonal_win(symbol_arr)
      true
    elsif check_for_horizontal_win(symbol_arr)
      true
    elsif check_for_vertical_win(symbol_arr)
      true
    else
      false
    end
  end

  def check_for_draw
    symbol_arr = make_symbol_arr
    if (symbol_arr[0] != ' ' && arr_all_same(symbol_arr))
      true
    else
      false
    end
  end

end
