require_relative "piece"
class Queen < Piece
  TYPE = "Q"


  def can?(current,new_location)
    possible_coordinates = get_possible_coordinates(current)
    possible_coordinates.include?(new_location)
  end

  def get_possible_coordinates(current)
    possible_hor_ver =[]
    y=0
    while y < 8
      possible_hor_ver << [y, current[1]]
      y+=1
    end

    x=0
    while x < 8
      possible_hor_ver << [current[0], x]
      x+=1
    end

  possible_diag = []

  count=1
    while count < 8
      possible_diag << [current[0]-count, current[1]-count]
      possible_diag << [current[0]-count, current[1]+count]
      possible_diag << [current[0]+count, current[1]+count]
      possible_diag << [current[0]+count, current[1]-count]

      count+=1
    end
    rook_possible = possible_hor_ver.select {|coordinate| coordinate != current}

    bishop_possible = possible_diag.select do |coordinate|
      if coordinate[0] > 7 || coordinate[0] < 0 || coordinate[1] > 7 || coordinate[1] < 0
        false
      else
        true
      end
    end
    rook_possible + bishop_possible
  end
end



