# this class will display messages to the user
class UI
  def get_user_input
    while true
      user_input = gets.chomp
      user_integer = input_to_int(user_input)
      break if valid_input(user_integer)

      prompt_invalid_input
    end
    user_integer
  end

  def get_menu_selection
    while true
      user_input = gets.chomp
      user_integer = input_to_int(user_input)
      break if user_integer < 5 && user_integer.positive?

      prompt_invalid_menu_selection
    end
    user_integer
  end

  def get_human_play_first_input
    while true
      user_input = gets.chomp
      user_integer = input_to_int(user_input)
      break if [1, 2].include?(user_integer)

      prompt_invalid_menu_selection
    end
    user_integer
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

  def input_to_int(user_input)
    user_input.to_i
  end

  def valid_input(integer)
    integer > 9 || integer < 1 ? false : true
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

  def prompt_for_turn
    print 'Please enter an number that corresponds to a space: '
  end

  def clear_terminal_screen
    system 'clear'
  end

  def prompt_player_win(player)
    puts "Player #{player.marker} has won!"
  end

  def prompt_draw
    puts 'Game draw!'
  end

  def prompt_invalid_space
    puts 'Please enter a valid space'
  end

  def prompt_invalid_input
    puts 'Please enter a number from 1-9'
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

  def turn_start(board)
    display_game_interface(board)
    prompt_for_turn
  end

  def welcome_user
    clear_terminal_screen
    welcome_message
    play_instructions
  end

  def computer_thinking_message
    thinking_messages = [
      "\nThinking...",
      "\nHmmmmmmm...",
      "\nClever move...",
      "\nThis is my game!",
      "\nWait...."
    ]
    puts thinking_messages[rand(5)]
  end

  def computer_delay
    sleep(rand(1..2))
  end

  def computer_turn_message
    computer_thinking_message
    computer_delay
  end
end
