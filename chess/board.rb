require_relative 'piece'
require 'colorize'

class Board  
  attr_accessor :grid
  def initialize
    @grid = populate
  end

  def move_piece(start_pos, end_pos)
    x, y = start_pos
    a, b = end_pos
    raise "There is no piece at #{start_pos}" if grid[x][y].is_a?(NullPiece) 
    if (a < 0 || a > 7) || (b < 0 || b > 7)
      raise "Position #{end_pos} is out of bounds"
    elsif grid[x][y].color == grid[a][b].color 
      raise "Invalid move: space occupied by own piece"
    # elsif @board[x][y].color != @board[a][b].color
    #   raise 'Invalid move (for now)'
    else #valid move (nothing in end_pos)
      grid[x][y], grid[a][b] = grid[a][b], grid[x][y]
    end
  end

  def self.valid_pos?(pos)
    x, y = pos 
    if (x < 0 || x > 7) || (y < 0 || y > 7)
      return false 
    else 
      return true 
    end
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def populate
    board = Array.new(8) { Array.new(8, []) }
    (0...8).each do |row|
      (0...8).each do |col|
        if row == 0 || row == 1
          board[row][col] = Piece.new(:white, self, [row, col])
        elsif row == 6 || row == 7
          board[row][col] = Piece.new(:black, self, [row, col])
        else 
          board[row][col] = NullPiece.instance
        end
      end
    end
    board
  end

end
