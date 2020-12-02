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
    player1 while @name =~ /^-?[0-9]+$/
  end

  def player2
    puts 'Hi, Welcome second player, please enter your name'
    names
    player2 while @name =~ /^-?[0-9]+$/

    def game_play
      user_input until TicTacToe.new.game_over?
      if TicTacToe.new.win?
        winner = winner()
        puts "Congratulations #{@name}!"
      elsif draw?
        puts 'Good try, You draw!'
      end
    end

    # getting user input
    def user_input
      puts 'Choose a number between 1 to 9 to play game'
      inputs = gets.strip
      inputs = TicTacToe.new.input_to_index(inputs)
      if TicTacToe.new.valid_move?(inputs)
        TicTacToe.new.move(inputs, TicTacToe.new.current_player)
      elsif !TicTacToe.new.valid_move?(inputs)
        puts 'Invalid move! Make a valid move from the unoccupied position'
      else
        self
      end
      TicTacToe.new.display_board
    end
end
end

plays = Play.new
plays.player1
plays.player2
plays.game_play
