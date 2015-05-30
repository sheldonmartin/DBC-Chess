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

  def resolved?
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
            new_location = View.input
            loop do
              if moves.include?(new_location)
                board.move(MAP[current_location],MAP[new_location])
                View.display_board(board)
                View.piece_move(piece,current_location,new_location)
                break
              else
                View.invalid
                View.where_to?(piece)
                View.possible?
                moves = p board.back_to_user(board.allowed_moves(MAP[current_location]))
                new_location = View.input
              end
            end
          end
      end
  end

end

#game = GameController.new
