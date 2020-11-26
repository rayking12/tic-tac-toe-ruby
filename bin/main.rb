#!/usr/bin/env ruby
class TicTacToe
  attr_accessor :board

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
	end
	
	# Winning numbers
	WINNING NUMBERS = [[1,2,3],[4,5,6],[7,8,9],[1,5,9],[3,5,7]]
# getting user input
	def user_input
		puts "Choose a number between 1 to 9 to the play game"
		inputs = gets.chomp
		inputs.to_i - 1
	end

	def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts " ----------- "
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts " ----------- "
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
	end

	def user_input_to_doard(num)

		if num	== (1..9) 
			@board[0] = num
		end
		return @board
	end
	
end

game = TicTacToe.new
game.display_board