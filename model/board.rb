require_relative "pawn"
require_relative "piece"
require "pry"

class Board

  USER_ACTUAL = {
    "a8"=>  [0,0],
    "a7"=>  [1,0],#y, x
    "a6"=>  [2,0],
    "a5"=>  [3,0],
    "a4"=>  [4,0],
    "a3"=>  [5,0],
    "a2"=>  [6,0],
    "a1"=>  [7,0],
    "b8"=>  [0,1],
    "b7"=>  [1,1],
    "b6"=>  [2,1],
    "b5"=>  [3,1],
    "b4"=>  [4,1],
    "b3"=>  [5,1],
    "b2"=>  [6,1],
    "b1"=>  [7,1],
    "c8"=>  [0,2],
    "c7"=>  [1,2],
    "c6"=>  [2,2],
    "c5"=>  [3,2],
    "c4"=>  [4,2],
    "c3"=>  [5,2],
    "c2"=>  [6,2],
    "c1"=>  [7,2],
    "d8"=>  [0,3],
    "d7"=>  [1,3],
    "d6"=>  [2,3],
    "d5"=>  [3,3],
    "d4"=>  [4,3],
    "d3"=>  [5,3],
    "d2"=>  [6,3],
    "d1"=>  [7,3],
    "e8"=>  [0,4],
    "e7"=>  [1,4],
    "e6"=>  [2,4],
    "e5"=>  [3,4],
    "e4"=>  [4,4],
    "e3"=>  [5,4],
    "e2"=>  [6,4],
    "e1"=>  [7,4],
    "f8"=>  [0,5],
    "f7"=>  [1,5],
    "f6"=>  [2,5],
    "f5"=>  [3,5],
    "f4"=>  [4,5],
    "f3"=>  [5,5],
    "f2"=>  [6,5],
    "f1"=>  [7,5],
    "g8"=>  [0,6],
    "g7"=>  [1,6],
    "g6"=>  [2,6],
    "g5"=>  [3,6],
    "g4"=>  [4,6],
    "g3"=>  [5,6],
    "g2"=>  [6,6],
    "g1"=>  [7,6],
    "h8"=>  [0,7],
    "h7"=>  [1,7],
    "h6"=>  [2,7],
    "h5"=>  [3,7],
    "h4"=>  [4,7],
    "h3"=>  [5,7],
    "h2"=>  [6,7],
    "h1"=>  [7,7]

  }

  attr_reader :board

  def initialize
    @board = Array.new(8){Array.new(8){"  "}}
    initialize_board
  end

  # input: original coordinate of the piece being moved.
  # output: N/A
  # result: moves piece to new_coordinates
  def move(original, new_coordinates)
    oy = USER_ACTUAL[original][0]
    ox = USER_ACTUAL[original][1]
    dy = USER_ACTUAL[new_coordinates][0]
    dx = USER_ACTUAL[new_coordinates][1]

    board[dy][dx] = board[oy][ox]
    board[oy][ox] = "  "
  end

  def to_s

    @board.join("").scan(/.{16}/).join("\n")
    # board.each
  end

  private

  def initialize_board
    location = USER_ACTUAL["a7"] #[1,0]
    # binding.pry
    board[location[0]][location[1]] = Pawn.new("white")

    # board[1][0] = Pawn.new("white")
  end
end

# board = Board.new
# p board.board
# puts "-" * 16
# puts board
# puts "-" * 16
# board.move("a7","a6")
# puts board
# puts "-" * 16
# p board.board
