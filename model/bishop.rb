require_relative "piece"

class Bishop < Piece
  TYPE = "B"

   def can?(current,new_location)

    possible_coordinates = get_possible_coordinates(current)
    possible_coordinates.include?(new_location)

  end

  def get_possible_coordinates(current)

    possible_ary = []

    count=1
    while count < 8
      possible_ary << [current[0]-count, current[1]-count]
      possible_ary << [current[0]-count, current[1]+count]
      possible_ary << [current[0]+count, current[1]+count]
      possible_ary << [current[0]+count, current[1]-count]

      count+=1
    end

    possible_ary.select do |coordinate|
      if coordinate[0] > 7 || coordinate[0] < 0 || coordinate[1] > 7 || coordinate[1] < 0
        false
      else
        true
      end
    end
  end

end

# bishop = Bishop.new("W")
# p bishop.get_possible_coordinates([3,3])
# p bishop.can?([3,3],[4,4])
