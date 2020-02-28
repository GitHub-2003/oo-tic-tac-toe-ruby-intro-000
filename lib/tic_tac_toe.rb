class TicTacToe
  # Define class constant WIN_COMBINATIONS
  WIN_COMBINATIONS = [
    [0,1,2],[3,4,5],[6,7,8],  # horizontal (top, mid, bottom)
    [0,4,8],[2,4,6],[0,3,6],  # vertical (left, mid, right)
    [1,4,7],[2,5,8]           # diaganols
  ]

  def initialize(board = nil)                       # constructor method
    @board = board || Array.new(9, " ")
  end
  def board                                         # getter method (from outside)
    @board
  end
  def board=(new_board)                             # setter method (from outside)
    @board = new_board
  end
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]}"
  end
  def input_to_index(user_input)
    user_input.to_i-1
  end
  def position_taken?(location)
    if !(@board[location].nil? || @board[location] == " " || @board[location] == "")
      true
    else
      false
    end
  end
  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  def turn
    puts "Please enter 1-9:"
    input = input_to_index(gets.strip)
    if !valid_move?(input)
      turn
    else
      move(input, current_player)
      display_board
    end
  end
  def move(index, current_player)
    @board[index] = current_player
  end
  def won?
    TicTacToe::WIN_COMBINATIONS.each do |win_combo|
      win_index_1 = win_combo[0]
      win_index_2 = win_combo[1]
      win_index_3 = win_combo[2]
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      if (position_1 == "X" || position_1 == "O") && (position_1 == position_2) && (position_1 == position_3)
        return win_combo
      else
        false
      end
    end
    if false
      return false
    end
  end

  def full?
    @board.all?{|token| token == "X" || token == "O"}   # all cells are "X" or "O"
  end
  def draw?
    return !won? && full?                               # no winner and board is full
  end
  def over?
    return won? || draw? || full?                       # game is won, draw, or full
  end
  def winner
    if (won? == nil)
      return(won?)
    else
      # puts(won?)
      won?.each do |cells|
        return board[cells]
      end
    end
  end
  def play
    while !over?
      turn
    end
    if draw?
      puts("Cat\'s Game!")
    elsif winner == "X"
      puts("Contratulations X!")
    elsif winner == "O"
      puts("Contratulations O!")
    else
      puts("What's going on?")
    end
  end
end

=begin
this_board = [" "," "," "," "," "," "," "," "," "]
this_board = ['X', 'O', 'X', 'O', 'X', 'O', 'X', 'O', 'X']
game = TicTacToe.new(this_board)


this_board = ['X', 'X', ' ', 'X', 'O', ' ', 'O', 'O', 'O']
game = TicTacToe.new(this_board)
game.display_board
puts(game.won?)
puts("-----")
game.full? == true ? puts("Full") : puts("!Full_Continue")
game.draw? == true ? puts("Draw") : puts("!Draw_continue")
game.over? == true ? puts("Over") : puts("!Over_continue")
game.won? == true ? puts("Won") : puts("!Won_continue")

puts(game.winner)
=end
