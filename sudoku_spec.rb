require 'rspec'
require_relative 'sudoku'

describe Sudoku do
  let (:board)      { "619030040270061008000047621486302079000014580031009060005720806320106057160400030" }
  let (:my_sudoku)  { Sudoku.new(board) }

  describe "#parse_board" do
    it "should parse a sudoku board into a 2D array" do
      parsed_board = my_sudoku.parse_board
      expected_board =  [
                          [6, 1, 9, 0, 3, 0, 0, 4, 0], 
                          [2, 7, 0, 0, 6, 1, 0, 0, 8], 
                          [0, 0, 0, 0, 4, 7, 6, 2, 1], 
                          [4, 8, 6, 3, 0, 2, 0, 7, 9], 
                          [0, 0, 0, 0, 1, 4, 5, 8, 0], 
                          [0, 3, 1, 0, 0, 9, 0, 6, 0], 
                          [0, 0, 5, 7, 2, 0, 8, 0, 6], 
                          [3, 2, 0, 1, 0, 6, 0, 5, 7], 
                          [1, 6, 0, 4, 0, 0, 0, 3, 0]
                        ]

      expect(parsed_board.length).to eq(9)
      expect(parsed_board[0].length).to eq(9)
      expect(parsed_board).to eq(expected_board)
    end
  end
end