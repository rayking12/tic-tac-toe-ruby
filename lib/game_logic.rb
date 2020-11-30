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
  attr_accessor :board
  include WinNumbers
  require_relative '../bin/main'
  def valid_move?(input)
    input.between?(0, 9) && !game.position_taken?(input)
  end

  def game_on?
    game.turn_counts < 9 && !win? ? true : false
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

  def game_play
    user_input until game_over?
    if win?
      winner = winner()
      puts "Congratulations #{winner}!"
    elsif draw?
      puts 'Good try!'
    end
  end
end

game = TicTacToe.new
game.game_play
