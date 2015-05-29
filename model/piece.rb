class Piece
  attr_reader :color

  TYPE = ""

  def initialize(color)
    @color = color
  end

  def to_s
    return "#{color}#{self.class::TYPE}"
  end

  # input: takes a coordinate which is an array containing x,y coordinates of the current location of the piece
  # output: An array of arrays that contain coordinates of all possible moves.
  def possible_moves(current_location, coordinates) # [[1,0],[1,1]...]
    coordinates.select {|coordinate| can?(current_location, coordinate) }
  end

  private

  # input: takes in current location, and coordinate
  # output: true if coordinate is a value move for this piece
  def can?(current_location, coordinate) # [1,0]
    raise NotImplementedError, 'can? method must be implemented in sub classes of Piece'
  end
end
