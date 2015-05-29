require_relative "piece"
class Knight < Piece
  TYPE = "N"
  def can?
    false
  end
end
