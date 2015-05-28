require_relative 'model/board'
require_relative 'view'

class GameController

  #include View
  attr_reader :board

  def initialize
    @board = Board.new
    View.welcome
    run
  end

  def run
    View.color
    color = View.input
    View.display_board(board)
    View.first_move
    View.choose_piece #WP
    piece = View.input
    View.choose
    current_location = View.input #a7
    View.where_to(piece)
    new_location = View.input
    board.move(current_location,new_location)
    View.display_board(board)
    View.piece_move(piece,current_location,new_location)

  end

end

game = GameController.new

