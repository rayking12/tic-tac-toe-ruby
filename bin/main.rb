#!/usr/bin/env ruby
require_relative '../lib/game_logic'
class Play 
  def names
    @name = gets.chomp
    case @name
    when /\D/
      puts 'Welcome ' + @name
    else
      puts 'Please do not enter numbers or symbols'
      return self unless @name =~ /^-?[0-9]+$/
    end
    
  end

  def player1
    puts 'Hi,Welcome first player, please enter your name'
    names
    while  @name =~ /^-?[0-9]+$/  || @name == ''
      player1
    end
  end

  def player2
    puts 'Hi, Welcome second player, please enter your name'
    names
    while  @name =~ /^-?[0-9]+$/ || @name == ''
      player2
    end
  end

  def game_play
    user_input until game_over?
    if TicTacToe.win?
      winner = winner()
      puts "Congratulations #{winner}!"
    elsif draw?
      puts 'Good try, You draw!'
  end
  end
  def game_over?
    draw? || win?
  end

   # getting user input
   def user_input
    puts 'Choose a number between 1 to 9 to play game'
    inputs = gets.strip
    inputs = input_to_index(inputs)
    if valid_move?(inputs)
      move(inputs, current_player)
    elsif !valid_move?(inputs)
      puts 'Invalid move! Make a valid move from the unoccupied position'
       
    else
      self
    end
    display_board
  end
end

plays = Play.new
plays.player1
plays.player2
game = TicTacToe.new
plays.game_play
game.game_over?
game = TicTacToe.win?
game.draw?
m = GameLogic.new
