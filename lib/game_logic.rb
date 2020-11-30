class GameLogic
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
    puts 'Welcome ' + @name
    puts 'Player2: What is your name?'
    @name_two = gets.strip
    puts 'Player2 : Welcome ' + @name_two
  end

  def winner
    player = ''
    player == win? ? @board[winner.first] : @players
  end
end
