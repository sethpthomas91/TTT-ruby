# frozen_string_literal: true

require_relative './Game'
require_relative './game_setup'

def run_game
  # game = Game.new
  # game.ui.welcome_user
  # game.run_game_loop
  # game.exit_game
  game_setup = GameSetup.new
  game_setup.main_menu
end

run_game
