class Sudoku

  def initialize(board)
    @board = board
  end

  def parse_board(board)
    number_board = board.split("").map { |number_string| number_string.to_i }
    parsed_board = number_board.each_slice(9).to_a
  end

  def save_empty_positions(board)
    empty_positions = []
    for x in 0...board.length
      for y in 0...board[x].length
        if board[x][y] == 0
          empty_positions << [x, y]
        end
      end
    end
    empty_positions
  end

  def check_row(board, row, value)
    for y in 0...board[row].length
      if board[row][y] == value
        return false
      end
    end
    true
  end

  def check_column(board, column, value)
    for x in 0...board.length
      if board[x][column] == value
        return false
      end
    end
    true
  end

  def check_3x3_square(board, row, column, value)
    square_size = 3
    row_corner = square_size * (row / square_size)
    column_corner = square_size * (column / square_size)
    
    for x in row_corner...(row_corner + square_size)
      for y in column_corner...(column_corner + square_size)
        if board[x][y] == value
          return false
        end
      end
    end
    true
  end


end