class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
    WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
    ]
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def input_to_index(input)
    return input.to_i - 1
  end
  def valid_move?(index)
  if index >= 0 && index <= 8 && position_taken?(index) == false
    return true
  else
    return false
  end
end
  def move(index, player = "X")
  if valid_move?(index) == true
    @board[index] = player
  end
  end
  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true
    else
      return false
    end
  end
  def turn
    puts "Please enter 1-9:"
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(index) == true
      @board[index] = "#{current_player}"
      display_board
    else
      @turn
    end
  end
  def turn_count
    turns_so_far = 0
    @board.each do |occurence|
      if occurence == "X" || occurence == "O"
        turns_so_far += 1
      end
    end
    turn_count = turns_so_far
  end
  def current_player
    if turn_count % 2 == 0
      return "X"
    elsif turn_count % 2 == 1
      return "O"
    end
  end
  def won?
    WIN_COMBINATIONS.each do |win_combo|
      position_1 = win_combo[0]
      position_2 = win_combo[1]
      position_3 = win_combo[2]
      if @board[position_1] == "X" && @board[position_2] == "X" && @board[position_3] == "X"
        return [position_1, position_2, position_3]
      elsif
        @board[position_1] == "O" && @board[position_2] == "O" && @board[position_3] == "O"
        return [position_1, position_2, position_3]
      end
    end
  return false
  end
  def full?
    @board.all? do |space|
      space != " "
    end
  end
  def draw?
    if full? == true &&
      won? == false
      return true
    else
     return false
    end
  end
  def over?
    if full? == true
      return true
    elsif won? != false
      return true
    else
      return false
    end
  end
  def winner
  unless won? == false
    pos_1 = won?[0]
    pos_2 = won?[1]
    pos_3 = won?[2]
      if @board[pos_1] == "X" && @board[pos_2] == "X" && @board[pos_3] == "X"
        return "X"
      elsif @board[pos_1] == "O" && @board[pos_2] == "O" && @board[pos_3] == "O"
        return "O"
      end
    end
  return nil
  end
  def play
    until over? == true || draw? == true
      turn
    end
    if won? != false
      puts "Congratulations #{winner}!"
    elsif draw? == true
      puts "Cat's Game!"
    end
  end
end

game = TicTacToe.new
game.move(0, "X")

game.turn
