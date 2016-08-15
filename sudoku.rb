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

  end
end