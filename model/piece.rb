class Piece
  attr_reader :color

  TYPE = ""

  def initialize(color)
    @color = color
  end

  def to_s
    return "#{color}#{self.class::TYPE}"
  end

  def get_possible_coordinates(current_location)
    raise NotImplementedError, 'get_possible_coordinates method must be implemented in sub classes of Piece'
  end
end
