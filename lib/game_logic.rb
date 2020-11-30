class GameLogic
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
    child_arr
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
    if @name.to_s? 
       puts 'Welcome ' + @name 
       else
        return gets.chomp
    puts 'Player2: What is your name?'
    @name_two = gets.strip
    if @name_two.to_s?
    puts 'Player2 : Welcome ' + @name_two
    else
      return gets.chomp
  end

  def winner
    player = ''
    player == win? ? @board[winner.first] : @players
  end
end
