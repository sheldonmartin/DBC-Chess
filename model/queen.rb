require_relative "piece"
class Queen < Piece
  TYPE = "Q"
  def can?
    false
  end
end
