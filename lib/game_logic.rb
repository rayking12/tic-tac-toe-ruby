require_relative '../bin/main'
class GameLogic
  class Game
    attr_reader :players, :board, :current_player, :other_player
    def initialize(players, board = Board.new)
      @players = players
      @board = board
      @current_player, @other_player = players.shuffle
    end
  end

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

  def names
    @name = gets.chomp
    case @name
    when /\D/
      puts 'Welcome ' + @name
    else
      puts 'Please put in a valid input'
      gets.chomp
    end
    name while @name =~ /^-?[0-9]+$/
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

