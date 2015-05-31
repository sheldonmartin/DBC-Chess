require_relative "piece"
require_relative "pawn"
require_relative "rook"
require_relative "knight"
require_relative "bishop"
require_relative "queen"
require_relative "king"

module Chess
  def self.generate_board
    board = Array.new(8){Array.new(8){"  "}}
    
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

    board
  end
end
