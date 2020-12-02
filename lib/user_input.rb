# require_relative '../lib/game_logic'
# module User
#   # getting user input
#   def user_input
#     user = TicTacToe.new
#     puts "player #{user.current_player} Choose a number between 1 to 9 to play game"
#     inputs = gets.strip
#     inputs = user.input_to_index(inputs)
#     if user.valid_move?(inputs)
#       user.move(inputs, user.current_player)
#     elsif user.valid_move?(inputs)
#       puts 'Invalid move! Make a valid move from the unoccupied position'
#     else
#       self
#     end
#     user.display_board
#   end
# end
