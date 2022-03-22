# Class that will hold all of the rules and win states for the game
class GameLogic
  attr_reader :winning_board, :draw_board

  def initialize
    @winning_board = false
    @draw_board = false
  end

  def top_row(symbol_arr)
    symbol_arr[0, 3]
  end

  def middle_row(symbol_arr)
    symbol_arr[3, 3]
  end

  def bottom_row(symbol_arr)
    symbol_arr[6, 3]
  end

  def left_vert_row(symbol_arr)
    [symbol_arr[0], symbol_arr[3], symbol_arr[6]]
  end

  def mid_vert_row(symbol_arr)
    [symbol_arr[1], symbol_arr[4], symbol_arr[7]]
  end

  def right_vert_row(symbol_arr)
    [symbol_arr[2], symbol_arr[5], symbol_arr[8]]
  end

  def top_left_to_bottom_row(symbol_arr)
    [symbol_arr[0], symbol_arr[4], symbol_arr[8]]
  end

  def top_right_to_bottom_row(symbol_arr)
    [symbol_arr[2], symbol_arr[4], symbol_arr[6]]
  end

  def row_win?(row_arr)
    if row_arr[0] != ' ' && arr_all_same(row_arr)
      true
    else
      false
    end
  end

  def check_for_horizontal_win(symbol_arr)
    top_row_win = row_win?(top_row(symbol_arr))
    middle_row_win = row_win?(middle_row(symbol_arr))
    bottom_row_win = row_win?(bottom_row(symbol_arr))
    if top_row_win || middle_row_win || bottom_row_win
      true
    else
      false
    end
  end

  def check_for_vertical_win(symbol_arr)
    left_vert_arr_win = row_win?(left_vert_row(symbol_arr))
    mid_vert_arr_win = row_win?(mid_vert_row(symbol_arr))
    right_vert_arr_win = row_win?(right_vert_row(symbol_arr))
    if left_vert_arr_win || mid_vert_arr_win || right_vert_arr_win
      true
    else
      false
    end
  end

  def check_for_diagonal_win(symbol_arr)
    top_left_to_bottom_arr_win = row_win?(top_left_to_bottom_row(symbol_arr))
    top_right_to_bottom_arr_win = row_win?(top_right_to_bottom_row(symbol_arr))
    if top_left_to_bottom_arr_win || top_right_to_bottom_arr_win
      true
    else
      false
    end
  end

  def check_for_win(symbol_arr)
    if check_for_diagonal_win(symbol_arr) || check_for_horizontal_win(symbol_arr) || check_for_vertical_win(symbol_arr)
      true
    else
      false
    end
  end

  def draw?(symbol_arr)
    symbol_arr.all? { |symbol| symbol != ' ' }
  end

  def arr_all_same(arr)
    arr.uniq.count <= 1
  end

  def return_winner_symbol(symbol_arr)
    board_rows = [
      top_row(symbol_arr),
      middle_row(symbol_arr),
      bottom_row(symbol_arr),
      left_vert_row(symbol_arr),
      mid_vert_row(symbol_arr),
      right_vert_row(symbol_arr),
      top_left_to_bottom_row(symbol_arr),
      top_right_to_bottom_row(symbol_arr)
    ]
    board_rows.each do |row|
      return row[0] if row_win?(row)
    end
  end
end
