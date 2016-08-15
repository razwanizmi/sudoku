require 'rspec'
require_relative 'sudoku'

describe Sudoku do
  let (:board)      { "090000006000960485000581000004000000517200900602000370100804020706000810300090000" }
  let (:my_sudoku)  { Sudoku.new(board) }

  describe "#parse_board" do
    it "should parse a sudoku board into a 2D array" do
      parsed_board = my_sudoku.parse_board
      expected_board =  [
                          [0,9,0,0,0,0,0,0,6], 
                          [0,0,0,9,6,0,4,8,5], 
                          [0,0,0,5,8,1,0,0,0], 
                          [0,0,4,0,0,0,0,0,0], 
                          [5,1,7,2,0,0,9,0,0], 
                          [6,0,2,0,0,0,3,7,0], 
                          [1,0,0,8,0,4,0,2,0], 
                          [7,0,6,0,0,0,8,1,0], 
                          [3,0,0,0,9,0,0,0,0]
                        ]

      expect(parsed_board.length).to eq(9)
      expect(parsed_board[0].length).to eq(9)
      expect(parsed_board).to eq(expected_board)
    end
  end
end