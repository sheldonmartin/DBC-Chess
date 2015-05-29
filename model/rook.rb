require_relative "piece"
class Rook < Piece
  TYPE = "R"

  def can?(current,new_location)
    possible_coordinates = get_possible_coordinates(current)
    possible_coordinates.include?(new_location)
  end

  def get_possible_coordinates(current)
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

