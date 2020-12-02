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
    player1 while @name =~ /^-?[0-9]+$/
  end

  def player2
    puts 'Hi, Welcome second player, please enter your name'
    names
    player2 while @name =~ /^-?[0-9]+$/
  end

  def game_play
    game = TicTacToe.new
    user_input until game.game_over?
    if game.win?
      winner = winner()
      puts "Congratulations #{winner}!"
    elsif draw?
      puts 'Good try, You draw!'
    end
  end

  # getting user input
  def user_input
    game = TicTacToe.new
    puts 'Choose a number between 1 to 9 to play game'
    inputs = gets.strip
    inputs = game.input_to_index(inputs)
    if game.valid_move?(inputs)
      game.move(inputs, game.current_player)
    elsif !game.valid_move?(inputs)
      puts 'Invalid move! Make a valid move from the unoccupied position'
    else
      self
    end
    game.display_board
  end
end

plays = Play.new
plays.player1
plays.player2
plays.game_play
