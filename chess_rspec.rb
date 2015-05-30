require_relative "model/board"
require_relative "model/pawn"

describe Pawn do
  it "should initialize a black pawn object" do
    pawn = Pawn.new("B")
    expect(pawn.to_s).to eq("BP")
  end

  it "should return list of possible moves for a pawn" do
    pawn = Pawn.new("B")
    expect(pawn.get_possible_coordinates([1,0])).to eq([[2,0],[0,0]])
  end
end

describe Rook do
  it "should initialize a black rook object" do
    pawn = Rook.new("B")
    expect(pawn.to_s).to eq("BR")
  end

  it "should return list of possible moves for a rook" do
    pawn = Rook.new("B")
    expect(pawn.get_possible_coordinates([0,0])).to eq([[1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7]])
  end
end

describe Board do
  it "should initialize a board object with all the pieces" do
    board = Board.new
    expect(board.to_s).to eq("8BR|BN|BB|BQ|BK|BB|BN|BR\n7BP|BP|BP|BP|BP|BP|BP|BP\n6  |  |  |  |  |  |  |  \n5  |  |  |  |  |  |  |  \n4  |  |  |  |  |  |  |  \n3  |  |  |  |  |  |  |  \n2WP|WP|WP|WP|WP|WP|WP|WP\n1WR|WN|WB|WQ|WK|WB|WN|WR\n a  b  c  d  e  f  g  h
")
  end

  it "should move a pawn to a new location" do
    board = Board.new
    board.move([1,0],[2,0])
    expect(board.to_s).to eq("8BR|BN|BB|BQ|BK|BB|BN|BR\n7  |BP|BP|BP|BP|BP|BP|BP\n6BP|  |  |  |  |  |  |  \n5  |  |  |  |  |  |  |  \n4  |  |  |  |  |  |  |  \n3  |  |  |  |  |  |  |  \n2WP|WP|WP|WP|WP|WP|WP|WP\n1WR|WN|WB|WQ|WK|WB|WN|WR\n a  b  c  d  e  f  g  h
")
  end

  it "should move a rook to a new location" do
    board = Board.new
    board.move([0,0],[4,0])
    expect(board.to_s).to eq("8  |BN|BB|BQ|BK|BB|BN|BR\n7BP|BP|BP|BP|BP|BP|BP|BP\n6  |  |  |  |  |  |  |  \n5  |  |  |  |  |  |  |  \n4BR|  |  |  |  |  |  |  \n3  |  |  |  |  |  |  |  \n2WP|WP|WP|WP|WP|WP|WP|WP\n1WR|WN|WB|WQ|WK|WB|WN|WR\n a  b  c  d  e  f  g  h
")
  end

  it "should limit moves horizontally when blocked" do
    board = Board.new
    board.move([0,0],[4,0])
    expect(board.possible_moves([4,0])).to eq()
  end
end



# describe Board do
#   it "should initialize a board object" do
#     board = Board.new
#     expect(board).to be_a Board
#   end

#   it "should initialize a board with just a pawn" do
#     chess_board = Board.new
#     expect(chess_board.board[1][0]).to be_a Pawn
#   end

#   it "should move a pawn: original cell should empty" do
#     chess_board = Board.new
#     chess_board.move("a7", "a6")
#     expect(chess_board.board[1][0]).to eq("  ")
#   end

#   it "should move a pawn: new spot should contain a pawn" do
#     chess_board = Board.new
#     chess_board.move("a7", "a6")
#     expect(chess_board.board[2][0]).to be_a Pawn
#   end
# end

# describe Pawn do
#   it "should initialize a pawn object" do
#     pawn = Pawn.new
#     expect(pawn).to be_a Pawn
#   end

#   it "should return list of possible moves" do
#     pawn = Pawn.new
#     expect(pawn.possible_moves).to eq()
#   end
# end
