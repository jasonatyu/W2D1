require 'singleton'

class Piece 
  attr_reader :color, :board, :pos, :value
  def initialize(color, board, pos)
    @pos = pos
    @board = board 
    @color = color
    @value = '*' 
  endgi

  # def to_s 
  #   puts "#{symbol}"
  # end

  # def empty?
  # end

  # def valid_moves 
  # end

  # def pos=(val)
  #   @pos = val
  # end

  # def symbol
    
  # end 

  # def move_into_check?(end_pos)
  # end
end

class NullPiece < Piece
  include Singleton
  def initialize 
  end 
end

class Pawn < Piece 
  def initialize 
  end 
end


