require 'singleton'
require_relative 'board'
require_relative 'slideable'
require_relative 'stepable'
require 'byebug'

class Piece 
  attr_reader :color, :board
  attr_accessor :pos
  def initialize(color, board, pos)
    @pos = pos
    @board = board 
    @color = color
  end

  def move_into_check?(end_pos)
    dup_board = board.dup 
    dup_board.move_piece(pos, end_pos)
    dup_board.in_check?(color)
  end

end

class NullPiece < Piece
  include Singleton
  def initialize 
  end 
end

class King < Piece 
  include Stepable 

  def symbol
    if self.color == :white
      checkmark = "\u2654"
      checkmark.encode('utf-8')
    else
      checkmark = "\u265A"
      checkmark.encode('utf-8')
    end
  end

  protected 
  def move_diffs
    [[-1,-1],[-1,0],[-1,1],[1,0],[1,-1],[1,1],[0,1],[0,-1]]
  end

end

class Knight < Piece 
  include Stepable 

  def symbol
    if self.color == :white
      checkmark = "\u2658"
      checkmark.encode('utf-8')
    else
      checkmark = "\u265E"
      checkmark.encode('utf-8')
    end
  end

  protected 
  def move_diffs
    [[-1,2],[-2,1],[-2,-1],[-1,-2],[1,-2],[2,-1],[2,1],[1,2]]
  end


end

class Queen < Piece 
  include Slideable 

  def initialize(color, board, pos)
    super
  end 

  def symbol
    if self.color == :white
      checkmark = "\u2655"
      checkmark.encode('utf-8')
    else
      checkmark = "\u265B"
      checkmark.encode('utf-8')
    end
  end

  protected 
  def move_dirs 
   return 'both'
  end

end

class Rook < Piece 
  include Slideable 

  def initialize(color, board, pos)
    super
  end 

  def symbol
    if self.color == :white
      checkmark = "\u2656"
      checkmark.encode('utf-8')
    else
      checkmark = "\u265C"
      checkmark.encode('utf-8')
    end
  end

  protected 
  def move_dirs 
   return 'horizontal'
  end

end

class Bishop < Piece 
  include Slideable 

  def initialize(color, board, pos)
    super
  end 

  def symbol
    if self.color == :white
      checkmark = "\u2657"
      checkmark.encode('utf-8')
    else
      checkmark = "\u265D"
      checkmark.encode('utf-8')
    end
  end

  protected 
  def move_dirs 
   return 'diagonal'
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
    if self.color == :white
      checkmark = "\u2659"
      checkmark.encode('utf-8')
    else
      checkmark = "\u265F"
      checkmark.encode('utf-8')
    end
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


