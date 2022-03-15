require_relative './computer_player'
require_relative './human_player'
require_relative './game'
require_relative './UI'

# This will handle game setup choices for the user
class GameSetup
  attr_reader :ui, :player_one, :player_two, :game

  def initialize(ui = UI.new)
    @ui = ui
    @player_one = nil
    @player_two = nil
    @game = nil
  end


  def main_menu
    human_vs_computer
    game_builder
    game.run_game_loop
  end

  def human_vs_human
    @player_one = HumanPlayer.new
    @player_two = HumanPlayer.new('O')
  end

  def human_vs_computer
    @player_one = HumanPlayer.new
    @player_two = ComputerPlayer.new
  end

  def game_builder
    new_game = Game.new(@player_one, @player_two)
    @game = new_game
  end

end