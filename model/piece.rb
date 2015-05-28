class Piece
  attr_reader :color
  def initialize(color)
    @color = color
  end
  # input: takes a coordinate which is an array containing x,y coordinates of the current location of the piece
  # output: An array of arrays that contain coordinates of all possible moves.
  def possible_moves
  end
end
