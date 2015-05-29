class Piece
  attr_reader :color

  TYPE = ""

  def initialize(color)
    @color = color
  end

  def to_s
    return "#{color}#{self.class::TYPE}"
  end

  def possible_moves(current_location, coordinates)
    coordinates.select {|coordinate| can?(current_location, coordinate) }
  end

  private

  def can?(current_location, coordinate)
    raise NotImplementedError, 'can? method must be implemented in sub classes of Piece'
  end
end
