require_relative 'model/board'
require_relative 'view'
require_relative 'model/map'
require 'pry'

class GameController
  PLAYERS = ["White","Black"]
  include MAP
  #include View
  attr_reader :board

  def initialize
    @board = Board.new
    View.display_game_start(board)
    #binding.pry
    run
  end

  def gameover?
    false
  end

  def run
      until gameover?
          PLAYERS.each do |player|
            View.player_turn(player)
            View.first_move?
            piece = View.input
            View.where_from?(piece)
            current_location = View.input
            View.possible?
           # binding.pry
            moves = p board.back_to_user(board.allowed_moves(MAP[current_location]))
            View.where_to?(piece)
            new_location = MAP[View.input]
            #valid or invalid move detection
            board.move(current_location,new_location)
            View.display_board(board)
            View.piece_move(piece,MAP.key(current_location),MAP.key(new_location))
          end
      end
  end

end

#game = GameController.new
