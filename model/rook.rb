require_relative "piece"
class Rook < Piece
  TYPE = "R"

  def can?(current,new_location) # [1,0]
    possible_coordinates = get_possible_coordinates(current)
    possible_coordinates.include?(new_location)
  end

  def get_possible_coordinates(current) #1d array that will be passed from board
  # forwardy = current[0]+1
  # backwardy = current[0]-1
  possible_ary =[]
  y=0
  while y < 8
    possible_ary << [y, current[1]]
    y+=1
  end

  x=0
  while x < 8
    possible_ary << [current[0], x]
    x+=1
  end

  possible_ary.select {|coordinate| coordinate != current}
  end

end

rook = Rook.new("W")

# p rook.get_possible_coordinates([3,3])
# p rook.can?([3,3],[3,4])
# p rook.can?([3,3],[2,6])
