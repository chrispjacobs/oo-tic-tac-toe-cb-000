class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  def WIN_COMBINATIONS
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
  end
  def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end
  def input_to_index(input)
    return input.to_i - 1
  end
  def valid_move?(board, index)
  if index >= 0 && index <= 8 && position_taken?(board, index) == false
    return true
  else
    return false
  end
end
  def move(board, index, player = "X")
  if valid_move?(board, index) == true
    board[index] = player
  end
  def position_taken?(board, index)
    if board[index] == "X" || board[index] == "O"
      return true
    else
      return false
    end
  end
  def turn(board)
    puts "Please enter 1-9:"
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(board, index) == true
      board[index] = "#{current_player(board)}"
      display_board(board)
    else
      turn(board)
    end
  end
  def turn_count(board)
    turns_so_far = 0
    board.each do |occurence|
      if occurence == "X" || occurence == "O"
        turns_so_far += 1
      end
    end
    turn_count = turns_so_far
  end
  def current_player(board)
    if turn_count(board) % 2 == 0
      current_player = "X"
    elsif turn_count(board) % 2 == 1
      "O"
    end
  end
  def won?(board)
    WIN_COMBINATIONS.each do |win_combo|
      position_1 = win_combo[0]
      position_2 = win_combo[1]
      position_3 = win_combo[2]
      if board[position_1] == "X" && board[position_2] == "X" && board[position_3] == "X"
        return [position_1, position_2, position_3]
      elsif
        board[position_1] == "O" && board[position_2] == "O" && board[position_3] == "O"
        return [position_1, position_2, position_3]
      end
    end
  return false
  end
  def full?(board)
    board.all? do |space|
      space != " "
    end
  end
  def draw?(board)
    if full?(board) == true &&
      won?(board) == false
      return true
    else
     return false
    end
  end
  def over?(board)
    if full?(board) == true
      return true
    elsif won?(board) != false
      return true
    else
      return false
    end
  end
  def winner(board)
  unless won?(board) == false
    pos_1 = won?(board)[0]
    pos_2 = won?(board)[1]
    pos_3 = won?(board)[2]
      if board[pos_1] == "X" && board[pos_2] == "X" && board[pos_3] == "X"
        @winner = "X"
      elsif board[pos_1] == "O" && board[pos_2] == "O" && board[pos_3] == "O"
        @winner = "O"
      end
    end
  return nil
  end
  def play(board)
    until over?(board) == true || draw?(board) == true
      turn(board)
    end
    if won?(board) != false
      puts "Congratulations #{winner(board)}!"
    elsif draw?(board) == true
      puts "Cat's Game!"
    end
  end
end
end
