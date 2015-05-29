require_relative "piece"
require_relative "pawn"
require_relative "rook"
require_relative "knight"
require_relative "bishop"
require_relative "king"
require_relative "queen"

class Board
  attr_reader :board

  def initialize
    @board = Array.new(8){Array.new(8){"  "}}
    initialize_board
  end

  # input: original coordinate of the piece being moved.
  # output: N/A
  # result: moves piece to new_location
  def move(original_location, new_location)
    oy = original[0]
    ox = original[1]
    dy = new_coordinates[0]
    dx = new_coordinates[1]

    board[dy][dx] = board[oy][ox]
    board[oy][ox] = "  "
  end

  def find_piece(piece_location)
    y = piece_location[0] 
    x = piece_location[1]

    board[x][y]
  end

  def possible_moves(piece_location, coordinates)
    find_piece(piece_location).possible_moves(piece_location, coordinates)
  end

  def to_s
    # @board.join("").scan(/.{16}/).join("\n")
    # board.map do |row|
    #   row.map do |position|
    #     "#{position}"
    #   end.join("|")
    # end.join("\n")

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
