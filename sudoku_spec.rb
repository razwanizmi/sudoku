require 'rspec'
require_relative 'sudoku'

describe Sudoku do
  let (:board)        { "090000006000960485000581000004000000517200900602000370100804020706000810300090000" }
  let (:my_sudoku)    { Sudoku.new(board) }
  let (:parsed_board)  { my_sudoku.parse_board(board) }

  describe "#parse_board" do
    describe "parses a sudoku board into a 2D array" do

      it "returns 9 elements" do
        expect(parsed_board.length).to eq(9)
      end

      it "returns 9 sub elements" do
        expect(parsed_board[0].length).to eq(9)
      end

      it "returns the correct elements" do
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
        expect(parsed_board).to eq(expected_board)
      end      
    end
  end

  describe "#save_empty_positions" do
    it "should save all of the empty positions, 0s, in a parsed board" do
      empty_positions = my_sudoku.save_empty_positions(parsed_board)
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

  describe "#check_row" do
    describe "should check that each value in the row does not equal the input" do
      
      it "returns true if value is not found" do
        expect(my_sudoku.check_row(parsed_board, 0, 2)).to be(true)
      end

      it "returns false if value is found" do
        expect(my_sudoku.check_row(parsed_board, 0, 9)).to be(false)
      end
    end
  end

  describe "#check_column" do
    describe "should check that each value in a column does not equal the input" do
      
      it "returns true if value is not found" do
        expect(my_sudoku.check_column(parsed_board, 0, 9)).to be(true)
      end

      it "returns false if value is found" do
        expect(my_sudoku.check_column(parsed_board, 0, 5)).to be(false)
      end
    end
  end

  describe "#check_3x3_square" do
    describe "should check that each value in a 3x3 square does not match the input" do
      
      it "returns true if value is not found" do
        expect(my_sudoku.check_3x3_square(parsed_board, 2, 2, 1)).to be(true)
        expect(my_sudoku.check_3x3_square(parsed_board, 7, 7, 9)).to be(true)
      end

      it "returns false if value is found" do
        expect(my_sudoku.check_3x3_square(parsed_board, 2, 2, 9)).to be(false)
        expect(my_sudoku.check_3x3_square(parsed_board, 7, 7, 1)).to be(false)
      end
    end
  end

  describe "#check_value" do
    describe "should check whether a value is valid for a particular position" do

      it "returns true if value is not found" do
        expect(my_sudoku.check_value(parsed_board, 0, 0, 2)).to be(true)
        expect(my_sudoku.check_value(parsed_board, 3, 7, 3)).to be(true)
      end

      it "returns false if value is found" do
        expect(my_sudoku.check_value(parsed_board, 0, 0, 9)).to be(false)
        expect(my_sudoku.check_value(parsed_board, 3, 7, 1)).to be(false)
      end
    end
  end

  describe "#solve_puzzle" do
    it "returns a solution to the puzzle passed in" do
      empty_positions = my_sudoku.save_empty_positions(parsed_board)
      expected_solution = [
                            [ 8,9,5,7,4,2,1,3,6 ], 
                            [ 2,7,1,9,6,3,4,8,5 ], 
                            [ 4,6,3,5,8,1,7,9,2 ], 
                            [ 9,3,4,6,1,7,2,5,8 ], 
                            [ 5,1,7,2,3,8,9,6,4 ], 
                            [ 6,8,2,4,5,9,3,7,1 ], 
                            [ 1,5,9,8,7,4,6,2,3 ], 
                            [ 7,4,6,3,2,5,8,1,9 ], 
                            [ 3,2,8,1,9,6,5,4,7 ]
                          ]
      expect(my_sudoku.solve_puzzle(parsed_board, empty_positions)).to eq(expected_solution)
    end
  end
end