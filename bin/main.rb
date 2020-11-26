#!/usr/bin/env ruby
class TicTacToe
  attr_accessor :board

  puts "Welcome, Input a number from 1-9"
  $user_input = gets.chomp

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
 end
        def user_input(num)
            num = [1, 2, 3, 4 ,5, 6, 7,8, 9]
            if $user_input == num.each
                print "your move has been made"
            elsif $user_input == !num.each
                puts "error"
            end
    end


	def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts " ----------- "
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts " ----------- "
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
end

game = TicTacToe.new
game.display_board
game.user_input(3)
