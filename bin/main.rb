#!/usr/bin/env ruby
class TicTacToe
  # require_relative '../lib/game_logic'

  attr_accessor :board

  def initialize
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [6, 4, 2],
    [0, 4, 8]
  ].freeze

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts ' ----------- '
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts ' ----------- '
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def user_input_to_doard(arr)
    @board[0] = arr if arr == (1..9)
    @board
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(position, token = 'X')
    @board[position] = token
  end

  def position_taken?(input)
    @board[input] == 'X' || @board[input] == 'O'
  end

  def valid_move?(input)
    input.between?(0, 9) && !position_taken?(input)
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

  def turn_counts
    taken_spot = 0
    @board.each do |i|
      taken_spot += 1 if %w[X O].include?(i)
    end
    taken_spot
  end

  def current_player
    @players = if turn_counts.even?
                 'X'
               else
                 'O'
               end
    @players
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [6, 4, 2],
    [0, 4, 8]
  ].freeze

  def win?
    WIN_COMBINATIONS.detect do |child_arr|
      @board[child_arr[0]] == @board[child_arr[1]] && @board[child_arr[1]] == @board[child_arr[2]] &&
        position_taken?(child_arr[0])
    end
  end

  def game_full?
    board.all? { |i| %w[O X].include?(i) }
  end

  def game_on?
    turn_counts < 9 && !win? ? true : false
  end

  def draw?
    !win? && game_full?
  end

  def game_over?
    draw? || win?
  end

  def name
    puts 'Player1: what is Your name?'
    @name = gets.chomp
    case @name
    when /\D/
      puts 'Welcome ' + @name
    else
      puts 'Please put in a valid input'
      gets.chomp
    end
    name while @name =~ /^-?[0-9]+$/

    puts 'Player2: what is Your name?'
    @name_two = gets.chomp
    case @name_two
    when /\D/
      puts 'Welcome ' + @name_two
    else
      puts 'Please put in a valid input'
      gets.chomp
    end
    name while @name_two =~ /^-?[0-9]+$/
  end

  def winner
    player = ''
    player == win? ? @board[winner.first] : @players
  end

  # GameLogic = GameLogic.new
  def game_play
    user_input until game_over?
    if win?
      winner = winner()
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end

game = TicTacToe.new
game.name
game.game_play
