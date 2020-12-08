# instruction to play game
require_relative '../lib/game_logic.rb'
class Player
  attr_writer :name
  def initialize(name)
    @name = name
  end

  def player_check
    player2 if @name == player1
  end
end
