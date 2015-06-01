require_relative 'checker'

module Checkers
  def self.generate_board
    board = Array.new(8){Array.new(8){"  "}}

    starting_rows = [0,1,2]

    starting_rows.each do |row|
      row % 2 != 0 ? column = 0 : column = 1

      4.times do
        board[row][column] = Checker.new("B")
        board[row + 5][column - 1] = Checker.new("W")
        column += 2
      end

      column = 1
    end

    board
  end
end
