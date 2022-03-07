require "./board"
require "./cell"
board = Board.new
puts "Welcome to Ruby Tic-Tac_Toe!\n"
puts "User input will be based on numbers\n"
board.display_grid_numbers
puts "Please enter an number that will select a space to play"
user_input = gets.chomp
puts user_input