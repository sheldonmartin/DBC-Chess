require_relative "piece"

class Pawn < Piece
  def to_s
    if color == "white"
      return "WP"
    else
      return "BP"
    end
  end
end

# pawn = Pawn.new("white")
# pawn2 = Pawn.new("black")
# puts pawn
# puts pawn2
