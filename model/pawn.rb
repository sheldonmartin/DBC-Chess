require_relative "piece"

class Pawn < Piece
  TYPE = "P"

  private

  def can?(current, new_location) # [1,0]
    y = new_location[0] # 1
    x = new_location[1] # 0

    possible_coordinates = get_possible_coordinates(current)
    possible_coordinates.each do |possible_coordinate|
      return true if possible_coordinate[0] == y && possible_coordinate[1] == x
    end

    return false


  end

  def get_possible_coordinates(current)
    return [[1,0],[5,3]] #move forward/backward from current
  end
end

pawn = Pawn.new("B")
p pawn.possible_moves([0,0],[[1,0],[2,0],[5,3]])
puts pawn
# pawn2 = Pawn.new("black")
# puts pawn
# puts pawn2
