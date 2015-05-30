require_relative "piece"

class Pawn < Piece
  TYPE = "P"

  #private

  def can?(current,new_location)
    possible_coordinates = get_possible_coordinates(current)
    possible_coordinates.include?(new_location)
  end

  def get_possible_coordinates(current)
    possible_ary = [[current[0]+1,current[1]],[current[0]-1,current[1]]]
    possible_pawn = possible_ary.select do |coordinate|
      if coordinate[0] > 7 || coordinate[0] < 0 || coordinate[1] > 7 || coordinate[1] < 0
        false
      else
        true
      end
    end
    possible_pawn
  end
end

