require_relative "piece"

class Pawn < Piece
  TYPE = "P"

  # private

  def can?(current,new_location) # [1,0]
    # y = new_location[0] # 1
    # x = new_location[1] # 0

     possible_coordinates = get_possible_coordinates(current)
    # possible_coordinates.each do |possible_coordinate|
    #   return true if possible_coordinate[0] == y && possible_coordinate[1] == x
    # end

    # return false
    possible_coordinates.include?(new_location)

  end

  def get_possible_coordinates(current) #1d array that will be passed from board
  forwardy = current[0]+1
  backwardy = current[0]-1
  possible_ary = [[forwardy,current[1]],[backwardy,current[1]]]
  end
end

pawn = Pawn.new("B")
p pawn.get_possible_coordinates([1,0])
p pawn.can?([1,0],[2,0])
puts pawn
