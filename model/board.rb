require_relative "map"

class Board
  attr_reader :board

  include MAP

  def initialize(board = nil)
    @board = board || Array.new(8){Array.new(8){"  "}}
  end

  def checkmate? #work in progress for the logic of this
    false
  end
  # input: original coordinate of the piece being moved.
  # output: N/A
  # result: moves piece to new_location
  def move(original_location, new_location)
    oy = original_location[0]
    ox = original_location[1]
    dy = new_location[0]
    dx = new_location[1]

    board[dy][dx] = board[oy][ox]
    board[oy][ox] = "  "
  end

  def find_piece(piece_location)
    y = piece_location[0]
    x = piece_location[1]

    board[y][x]
  end

  def possible_moves(piece_location)
    find_piece(piece_location).get_possible_coordinates(piece_location)
  end

  def to_s
    board_string = ""
    y_axis_label = 8

    board.map.with_index do |row, index|
      board_string << "#{y_axis_label}"
      board_string << row.map do |position|
        "#{position}"
      end.join("|") + "\n"
      y_axis_label -= 1
    end.join("\n")

    board_string << " a  b  c  d  e  f  g  h\n" # x-axis label
  end
end
