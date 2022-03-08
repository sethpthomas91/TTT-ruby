# frozen_string_literal: true

require_relative './board'
require_relative './UI'

board = Board.new
ui = UI.new
ui.welcome_message
ui.play_instructions
winner = false
while winner == false

  board.display_game_interface
  ui.prompt_for_turn
  user_input = gets.chomp
  board.player_x_move(user_input)
  if board.check_for_win
    ui.prompt_x_win
    break
  elsif board.check_for_draw
    ui.prompt_draw
    break
  end

  board.display_game_interface
  ui.prompt_for_turn
  user_input = gets.chomp
  board.player_o_move(user_input)
  if board.check_for_win
    ui.prompt_o_win
    break
  elsif board.check_for_draw
    ui.prompt_draw
    break
  end
end

ui.exit_message
