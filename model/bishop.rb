require_relative "piece"

class Bishop < Piece
  TYPE = "B"

  def can?
    false
  end
end
