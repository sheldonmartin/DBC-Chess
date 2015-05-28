require_relative "model/board"
require_relative "model/pawn"

describe Board do
  it "should initialize a board object" do
    board = Board.new
    expect(board).to be_a Board
  end

  it "should initialize a board with just a pawn" do
    chess_board = Board.new
    expect(chess_board.board[1][0]).to be_a Pawn
  end

  it "should move a pawn: original cell should empty" do
    chess_board = Board.new
    chess_board.move("a7", "a6")
    expect(chess_board.board[1][0]).to eq("  ")
  end

  it "should move a pawn: new spot should contain a pawn" do
    chess_board = Board.new
    chess_board.move("a7", "a6")
    expect(chess_board.board[2][0]).to be_a Pawn
  end
end

describe Pawn do
  it "should initialize a pawn object" do
    pawn = Pawn.new
    expect(pawn).to be_a Pawn
  end

  it "should return list of possible moves" do
    pawn = Pawn.new
    expect(pawn.possible_moves).to eq()
  end
end
