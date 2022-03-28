require_relative './player'

class HumanPlayer < Player
  def initialize(marker = 'X', is_computer: false)
    @marker = marker
    @is_computer = is_computer
  end

  def move(board:, maximizing_player:)
    user_input = get_integer_between(1, 9)
    user_input = check_is_valid_human_move(user_input, board)
  end

  def check_is_valid_human_move(user_input, board)
    valid_move = board.valid_move?(user_input)
    while valid_move == false
      prompt_invalid_space(user_input)
      user_input = get_integer_between(1, 9)
      valid_move = board.valid_move?(user_input)
    end
    user_input
  end

  def get_input
    gets.chomp
  end

  def get_integer_between(lower_int, upper_int)
    while true
      user_input = get_input
      user_integer = input_to_int(user_input)
      break if is_valid_input_between(user_integer, lower_int, upper_int)

      prompt_invalid_input(lower_int, upper_int)
    end
    user_integer
  end

  def is_valid_input_between(integer, lower_int, upper_int)
    integer < lower_int || integer > upper_int ? false : true
  end

  def input_to_int(user_input)
    user_input.to_i
  end

  def prompt_invalid_input(lower_int, upper_int)
    puts "Please enter a valid selection between #{lower_int} and #{upper_int}"
  end

  def prompt_invalid_space(invalid_user_input)
    puts "#{invalid_user_input} is already played. \nPlease enter a valid move"
  end

end
