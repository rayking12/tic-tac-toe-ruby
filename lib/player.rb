# instruction to play game
class Player
  attr_writer :name
  def player_check(name)
    @name = name
    player2 if @name == player1
  end
  self
end
