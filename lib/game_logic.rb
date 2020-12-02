module WinNumbers
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
end
class GameLogic
  def valid_move?(input)
    input.between?(0, 9) && !position_taken?(input)
  end

  def game_on?
    turn_counts < 9 && !win? ? true : false
  end

  def draw?
    !win? && game_full?
  end

  def game_over?
    draw? || win? || game_full
  end

  def winner
    player = ''
    player == win? ? @board[winner.first] : @players
  end
end
class TicTacToe < GameLogic
  attr_reader :board
  include WinNumbers
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

  def current_player
    @players = turn_counts.even? ? 'X' : 'O'
    @players
  end

  def game_over?
    draw? || win?
  end

  def win?
    WIN_COMBINATIONS.detect do |child_arr|
      @board[child_arr[0]] == @board[child_arr[1]] && @board[child_arr[1]] == @board[child_arr[2]] &&
        position_taken?(child_arr[0])
    end
  end

  def game_full?
    board.all? { |i| %w[O X].include?(i) }
  end

  def turn_counts
    taken_spot = 0
    @board.each do |i|
      taken_spot += 1 if %w[X O].include?(i)
    end
    taken_spot
  end

  def user
    play = Play.new
    play.turn(current_player)
    play.welcome
    play.input
    if valid_move?(play.input)
      move(play.input, current_player)
    elsif !valid_move?(play.input)
      play.invalid
    else
      self
    end
    display_board
  end
end
