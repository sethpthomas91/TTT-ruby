require_relative './game'
require_relative './game_setup'

def run_game
  game_setup = GameSetup.new
  game_setup.main_menu
end

run_game
