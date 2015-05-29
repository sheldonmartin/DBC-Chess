module View

  def self.display_game_start(board)
    welcome
    color
    display_board(board)
  end

  def self.welcome
    puts "Welcome to our awesome chess game!"
  end

  def self.input
    gets.chomp
  end

  def self.display_board(board)
    puts board
  end

  def self.color
    puts "What color do you want to be? (black or white)"
  end

  def self.first_move?
    puts "What piece do you want to move?"
  end

  def self.where_from?(piece)
    puts "What is the location of the #{piece} you want to move?"
  end

  def self.where_to?(piece)
    puts "Where do you want to move your #{piece} to?"
  end

  def self.possible?
    puts "These are your possible moves:"
  end

  def self.piece_move(piece, current, updated)
    puts "You moved #{piece} from #{current} to #{updated}."
  end

  def self.capture(color,piece)
    puts "#{color} player captured #{piece}."
  end

  def self.invalid
    puts "That is an invalid move."
  end

  def self.white_turn
    puts "White player's turn."
  end

  def self.black_turn
    puts "Black player's turn."
  end

end
