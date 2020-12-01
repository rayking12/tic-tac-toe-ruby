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
  end

  def player2
    puts 'Hi, Welcome second player, please enter your name'
    names
  end
end

plays = Play.new
plays.player1
plays.player2
game = TicTacToe.new
game.game_play
