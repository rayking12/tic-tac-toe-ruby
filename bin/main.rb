#!/usr/bin/env ruby
require_relative '../lib/game_logic'
require_relative '../lib/player'

# getting player names
def names
  @name = gets.chomp
  case @name
  when /\D/
    puts 'Welcome ' + @name
  else
    puts 'Please do not enter numbers or symbols'
    names unless @name =~ /[a-zA-Z]/ && !@name.nil? && @name =~ /\S/
  end
end

def player1
  puts 'Hi,Welcome , please enter your name'
  names
end

def player2
  puts 'Hi, Welcome second player, please enter your name'
  names
end

def welcome
  game_logic = GameLogic.new
  puts 'Choose a number between 1 and 9 to play this game'
  @inputs = gets.strip
  @inputs = game_logic.input_to_index(@inputs)
end

def turn(playern)
  @turn_name = playern
  puts 'it is your turn ' + @turn_name
end

def input
  @inputs
end

def invalid
  puts 'Invalid move! Make a valid move from the unoccupied position'
end

def player_message
  puts 'that name is taken!'
end

def game_play
  game = GameLogic.new
  puts game.user until game.game_over?
  if game.win?
    @winner = game.winner
    @winner = @name
    puts "Congratulations #{@name}!"
  elsif game.draw?
    puts 'Good try, You draw!'
  end
end

puts player1
puts player2
puts game_play
