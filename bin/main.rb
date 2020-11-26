#!/usr/bin/env ruby
class TicTacToe
  attr_accessor :board

  def initialize
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

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
    puts 'Choose a number between 1 to 9 to the play game'
    inputs = gets.strip
    inputs = input_to_index(inputs)
    if valid_move?(inputs)
      move(inputs, current_player)
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
end

def current_player
  players = if turn_counts.even?
              'X'
            else
              'O'
            end
  players
end

game = TicTacToe.new
game.user_input
