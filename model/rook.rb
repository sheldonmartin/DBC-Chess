require_relative "piece"
class Rook < Piece
  TYPE = "R"
  def can?
    false
  end
end
