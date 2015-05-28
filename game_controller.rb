require_relative 'Board'

class GameController


  def initialize
    @board = Board.new
    View.welcome
    run
  end

  def run
    View.color
    color = View.input
    @board = initialize_board #places all pieces on the board.
    View.first_move
    View.choose_piece
    piece = View.input
    View.choose
    old_location = View.input #a7
    View.where_to(piece)
    new_location = View.input
    @board.move(old_location,new_location)


  end

end
