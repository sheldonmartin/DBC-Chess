require_relative 'model/board'
require_relative 'view'

class GameController

  #include View
  attr_reader :board

  def initialize
    @board = Board.new
    View.display_game_start
    run
  end

  def run
    color = View.input
    if color == "white"
      View.first_move?
      piece = View.input
      View.where_from?(piece)
      current_location = View.input
      View.where_to?(piece)
      new_location = View.input
      board.move(current_location,new_location)
      View.display_board(board)
      View.piece_move(piece,current_location,new_location)
      #if captured
      View.capture
      #if move invalid
      View.invalid

    #black player's turn LOOP
    View.black_turn
  end

end

game = GameController.new

