# frozen_string_literal: true

# Class that will hold all of the rules and win states for the game
class GameLogic
  attr_reader :winning_board, :draw_board

  def initialize
    @winning_board = false
    @draw_board = false
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

  def check_for_win(symbol_arr)
    if check_for_diagonal_win(symbol_arr) || check_for_horizontal_win(symbol_arr) || check_for_vertical_win(symbol_arr)
      true
    else
      false
    end
  end

  def check_for_draw(symbol_arr)
    symbol_arr.all? { |symbol| symbol != ' ' }
  end

  def arr_all_same(arr)
    arr.uniq.count <= 1
  end
end
