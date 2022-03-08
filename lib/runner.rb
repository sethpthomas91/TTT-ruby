# frozen_string_literal: true

require './board'
require './cell'
board = Board.new
puts "Welcome to Ruby Tic-Tac_Toe!\n"
puts "User input will be based on numbers\n"
until board.check_for_win || board.check_for_draw
  board.display_game_interface
  puts 'Please enter an number that will select a space to play'
  user_input = gets.chomp
  board.player_x_move(user_input)
  board.display_game_interface
  puts 'Please enter an number that will select a space to play'
  user_input = gets.chomp
  board.player_o_move(user_input)
end
