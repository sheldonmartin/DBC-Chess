require_relative "piece"

class King < Piece
    TYPE = "K"

  def get_possible_coordinates(current)
    possible_ary = []

    possible_ary << [current[0]-1,current[1]-1]
    possible_ary << [current[0]-1,current[1]]
    possible_ary << [current[0]-1,current[1]+1]
    possible_ary << [current[0],current[1]+1]
    possible_ary << [current[0]+1,current[1]+1]
    possible_ary << [current[0]+1,current[1]]
    possible_ary << [current[0]+1,current[1]-1]
    possible_ary << [current[0],current[1]-1]

    possible_ary.select do |coordinate|
      if coordinate[0] > 7 || coordinate[0] < 0 || coordinate[1] > 7 || coordinate[1] < 0
        false
      else
        true
      end
    end
  end
end
