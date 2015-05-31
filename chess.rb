require_relative 'game_controller'
require_relative 'model/board'
require_relative 'model/chess_modules'

board = Board.new(Chess.generate_board)
GameController.new(board)
