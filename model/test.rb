require_relative "board"
board = Board.new
puts board
p board.find_piece([1,0])
p board.find_piece([2,0])
p board.spots_taken
