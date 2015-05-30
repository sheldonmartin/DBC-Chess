require_relative "board"

board = Board.new
puts board

# p board.possible_moves([0,0])
# test.move([0,1], [5,5])
# puts test

board.move([0,0],[4,2]) # move black
board.move([7,0],[4,4]) # move white
# board.move([1,0],[4,4]) # move black
# board.move([7,3],[4,3])
puts board
p board.possible_moves([4,2])
# p board.possible_moves([4,4])
# p board.find_piece([10,10])
