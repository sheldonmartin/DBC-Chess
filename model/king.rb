require_relative "piece"
class King < Piece
    TYPE = "K"

def can?(current,new_location) # [1,0]
    possible_coordinates = get_possible_coordinates(current)
    possible_coordinates.include?(new_location)
  end

  def get_possible_coordinates(current) #1d array that will be passed from board

  possible_ary = []
  # forwardy = current[0]+1
  # backwardy = current[0]-1
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
  # possible_ary = [[forwardy,current[1]],[backwardy,current[1]]]

  end

end

king = King.new("W")
p king.get_possible_coordinates([0,0])
p king.can?([3,3],[5,7])
