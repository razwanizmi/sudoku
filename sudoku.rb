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

    board.each_with_index do |x_val, x_ind|
      x_val.each_with_index do |y_val, y_ind|
        if y_val == 0
          empty_positions << [x_ind, y_ind]
        end
      end
    end
    empty_positions
  end

  def check_row(board, row, value)
    board[row].each do |element|
      if element == value
        return false
      end
    end
    true
  end
end