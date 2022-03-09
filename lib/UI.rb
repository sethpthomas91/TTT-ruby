# frozen_string_literal: true

# this class will display messages to the user
class UI
  def welcome_message
    puts "Welcome to Ruby Tic-Tac-Toe\n"
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

  def prompt_x_win
    puts 'X wins!'
  end

  def prompt_o_win
    puts 'O wins!'
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

end
