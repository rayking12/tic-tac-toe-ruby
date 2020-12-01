require_relative '../lib/game_logic'
require_relative './bin/main'
class Play
	game = GameLogic.new
	case game.names
	when game.@current_player == game.@Players
	puts "#{game.@current_player} enter your name!"

end
