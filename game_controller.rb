require_relative 'view'
require_relative 'model/map'
require 'pry'

class GameController
  PLAYERS = ["White","Black"]
  include MAP
  #include View
  attr_reader :board

  def initialize(board)
    @board = board
    View.display_game_start(board)
    #binding.pry
    run
  end

  def run
      until board.game_over?
          PLAYERS.each do |player|
            View.player_turn(player)
            # View.first_move?
            # piece = View.input
            current_location = nil
            piece = nil
            loop do
              View.where_from?
              current_location = View.input
              piece = board.find_piece(MAP[current_location])
              piece != '  ' ? break : View.invalid
            end
            View.possible?
           # binding.pry
            moves = p back_to_user(board.possible_moves(MAP[current_location]))
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
                View.where_to?
                View.possible?
                moves = p back_to_user(board.possible_moves(MAP[current_location]))
                new_location = View.input
              end
            end
          end
      end
  end

  def back_to_user(allowed_array)
    allowed_array.map{ |coordinate| MAP.key(coordinate)}
  end
end
