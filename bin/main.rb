#!/usr/bin/env ruby
require_relative '../lib/game_logic.rb'
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
    player1 while @name =~ /^-?[0-9]+$/ || @name == ''
  end

  def player2
    puts 'Hi, Welcome second player, please enter your name'
    names
    player2 while @name =~ /^-?[0-9]+$/ || @name == ''
    end

  def game_play
    game = TicTacToe.new
    game.user_input until game.game_over?
    if game.win?
      @winner = game.winner
      @winner = @name
      puts "Congratulations #{@name}!"
    elsif game.draw?
      puts 'Good try, You draw!'
    end
  end

  def welcome
    puts "player #{TicTacToe.new.current_player} Choose a number between 1 to 9 to play game"
    @inputs = gets.strip
    @inputs = TicTacToe.new.input_to_index(inputs)
  end

  def inputs
    @inputs
  end

  def invalid
    puts 'Invalid move! Make a valid move from the unoccupied position'
  end
end

plays = Play.new
plays.player1
plays.player2
plays.game_play
