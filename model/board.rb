require_relative "piece"
require_relative "pawn"
require_relative "rook"
require_relative "knight"
require_relative "bishop"
require_relative "king"
require_relative "queen"
require_relative "map"

class Board
  attr_reader :board

  include MAP

  def initialize
    @board = Array.new(8){Array.new(8){"  "}}
    initialize_board
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

  def allowed_moves(piece_location)
    possible_moves(piece_location) -  (possible_moves(piece_location)&spots_taken)
  end

  def back_to_user(allowed_array)
    allowed_array.map{ |coordinate| MAP.key(coordinate)}
  end

  def spots_taken
    ary = []
      MAP.each do |key,value|
        if find_piece(value) != "  "
          ary << value
        end
      end
    ary
  end

  def valid_move(new_location,allowed_array) #want this to evaluate to true for use in controller
    allowed_array.include?(new_location)
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

  private

  def initialize_board
    8.times do |i|
      board[1][i] = Pawn.new("B")
      board[6][i] = Pawn.new("W")
    end

    rows_and_colors = [[0,"B"],[7,"W"]] # contains pairs of starting rows and it's color

    rows_and_colors.each do |row_and_color|
      row = row_and_color[0]
      color = row_and_color[1]

      board[row][0] = Rook.new(color)
      board[row][7] = Rook.new(color)
      board[row][1] = Knight.new(color)
      board[row][6] = Knight.new(color)
      board[row][2] = Bishop.new(color)
      board[row][5] = Bishop.new(color)
      board[row][3] = Queen.new(color)
      board[row][4] = King.new(color)
    end
  end
end
