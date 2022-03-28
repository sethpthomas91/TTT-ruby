# this class will display messages to the user
class UI
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

  def prompt_set_unbeatable(player)
    puts "Do you want computer player #{player.marker} to be unbeatable?
1. yes
2. no
"
  end

  def prompt_play_first_question
    print "Do you want to play first?
1. yes
2. no
"
  end

  def prompt_invalid_menu_selection
    puts 'Please select a valid option'
  end

  def welcome_message
    puts "Welcome to Ruby Tic-Tac-Toe\n"
  end

  def game_selection_prompt
    puts "
Please make a selection from the choices below:

1. Human vs Human
2. Human vs Computer
3. Computer vs Computer
4. Exit
"
  end

  def play_instructions
    puts "The user will play using numbers on the keyboard.\n"
    puts "When prompted for an input input a number from 1-9\n"
    puts "Don't worry if you entered a wrong value, the computer will just reprompt you.\n"
  end

  def prompt_for_turn(player)
    puts "Player #{player.marker}, please enter an number that corresponds to a space: "
  end

  def clear_terminal_screen
    # system 'clear'
  end

  def prompt_player_win(player)
    puts "Player #{player.marker} has won!"
  end

  def prompt_draw
    puts 'Game draw!'
  end

  def prompt_invalid_input(lower_int, upper_int)
    puts "Please enter a valid selection between #{lower_int} and #{upper_int}"
  end

  def prompt_invalid_space(invalid_user_input)
    puts "#{invalid_user_input} is already played. \nPlease enter a valid move"
  end

  def exit_message
    puts 'Thanks for playing!'
  end

  def display_game_interface(board)
    puts ''
    puts "#{board.grid[0].game_display} | #{board.grid[1].game_display} | #{board.grid[2].game_display}"
    puts '--+---+--'
    puts "#{board.grid[3].game_display} | #{board.grid[4].game_display} | #{board.grid[5].game_display}"
    puts '--+---+--'
    puts "#{board.grid[6].game_display} | #{board.grid[7].game_display} | #{board.grid[8].game_display}"
    puts ''
  end

  def turn_start(board, player)
    display_game_interface(board)
    prompt_for_turn(player)
  end

  def welcome_user
    clear_terminal_screen
    welcome_message
    play_instructions
  end
end
