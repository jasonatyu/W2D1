require 'singleton'
require_relative 'board'
require 'byebug'

class Piece 
  attr_reader :color, :board, :value
  attr_accessor :pos
  def initialize(color, board, pos)
    @pos = pos
    @board = board 
    @color = color
    @value = '*' 
  end

  def valid_moves
  end

  def symbol
  end 

  # def move_into_check?(end_pos)
  # end
end

class NullPiece < Piece
  include Singleton
  def initialize 
  end 
end

class Pawn < Piece 

  def initialize(color, board, pos)
    super
  end 
  
  def forward_dir 
    if self.color == :white
      1 
    elsif self.color == :black
      -1
    end
  end

  def symbol
    puts "P"
  end

  def valid_moves
    res = []
    x, y = pos
    if Board.valid_pos?([x + forward_dir, y]) && (@board[[x + forward_dir, y]].color != self.color || @board[[x + forward_dir, y]].is_a?(NullPiece))
      res << [x + forward_dir, y]
    end
    if Board.valid_pos?([x + forward_dir, y - 1]) && @board[[x + forward_dir, y]].color != self.color && !@board[[x + forward_dir, y]].is_a?(NullPiece)
      res << [x + forward_dir, y - 1]
    end
    if Board.valid_pos?([x + forward_dir, y + 1]) && @board[[x + forward_dir, y]].color != self.color && !@board[[x + forward_dir, y]].is_a?(NullPiece)
      res << [x + forward_dir, y + 1]
    end
    res
  end
end


