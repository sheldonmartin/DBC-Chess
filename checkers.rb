require_relative 'game_controller'
require_relative 'model/board'
require_relative 'model/checkers_modules'

board = Board.new(Checkers.generate_board)
GameController.new(board)
