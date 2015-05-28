module View
  def self.welcome
    puts "Welcome to our awesome chess game!"
  end

  def self.input
    gets.chomp
  end

  def self.display_board(board)
  end

  def self.color
    puts "What color do you want to be? (Black or White)"
  end

  def self.first_move
    puts "White goes first."
  end

  def self.choose_piece
    puts "What piece do you want to move?"
  end

  def self.choose
    puts "What is the location of the piece you want to move?"
  end

  def self.where_to(piece)
    puts "Where do you want to move your #{piece} to?"
  end

  end
  def self.piece_move(piece, origin, updated)
    puts "You are moving #{piece} from #{origin} to #{updated}."
  end


  end
end
