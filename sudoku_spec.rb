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

  describe "#save_empty_positions" do
    it "should save all of the empty positions, 0s, in a parsed board" do
      empty_positions = my_sudoku.save_empty_positions
      expected_positions =  [
                              [0,0],[0,2],[0,3],[0,4],[0,5],[0,6],[0,7],[1,0],[1,1], 
                              [1,2],[1,5],[2,0],[2,1],[2,2],[2,6],[2,7],[2,8],[3,0], 
                              [3,1],[3,3],[3,4],[3,5],[3,6],[3,7],[3,8],[4,4],[4,5], 
                              [4,7],[4,8],[5,1],[5,3],[5,4],[5,5],[5,8],[6,1],[6,2], 
                              [6,4],[6,6],[6,8],[7,1],[7,3],[7,4],[7,5],[7,8],[8,1], 
                              [8,2],[8,3],[8,5],[8,6],[8,7],[8,8]
                            ]
      expect(empty_positions.length).to eq(51)
      expect(empty_positions).to eq(expected_positions)
    end
  end
end