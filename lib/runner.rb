# frozen_string_literal: true

require_relative './Game'

def run_game
  game = Game.new
  game.ui.welcome_user
  game.run_game_loop
  game.exit_game
end

run_game
