require_relative 'piece'

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
        #white
        if row == 0 
          if col == 0 || col == 7 
            board[row][col] = Rook.new(:white, self, [row, col])
          elsif col == 1 || col == 6
            board[row][col] = Knight.new(:white, self, [row, col])
          elsif col == 2 || col == 5
            board[row][col] = Bishop.new(:white, self, [row, col])
          elsif col == 3
            board[row][col] = Queen.new(:white, self, [row, col])
          elsif col == 4
            board[row][col] = King.new(:white, self, [row, col])
          end
        elsif row == 1
          board[row][col] = Pawn.new(:white, self, [row, col])
        elsif row == 6 
          board[row][col] = Pawn.new(:black, self, [row, col])
        elsif row == 7
          if col == 0 || col == 7 
            board[row][col] = Rook.new(:black, self, [row, col])
          elsif col == 1 || col == 6
            board[row][col] = Knight.new(:black, self, [row, col])
          elsif col == 2 || col == 5
            board[row][col] = Bishop.new(:black, self, [row, col])
          elsif col == 3
            board[row][col] = Queen.new(:black, self, [row, col])
          elsif col == 4
            board[row][col] = King.new(:black, self, [row, col])
          end
        else
          board[row][col] = NullPiece.instance
        end
      end
    end
    board
  end

   #to test (row, col): (1,5) -> (2, 5); (6, 4) -> (4, 4); (1,6)->(3,6); (0,3)->(3,7)
  def in_check?(color)
    own_king_pos = []
    (0...grid.length).each do |row|
      (0...grid.length).each do |col|
        if grid[row][col].color == :color && grid[row][col].is_a?(King)
          own_king_pos = grid[row][col].pos
          break
        end
      end
    end
    opponent_pieces = []
    (0...grid.length).each do |row|
      (0...grid.length).each do |col|
        if color == :white 
          if grid[row][col].color == :black
            opponent_pieces << grid[row][col]
          end
        elsif color == :black
          if grid[row][col].color == :white
            opponent_pieces << grid[row][col]
          end
        end
      end
    end
    opponent_pieces.any? { |piece| piece.valid_moves.include?(own_king_pos) }
  end

  def checkmate?(color)
    return false if !in_check?(color)
    if in_check?(color)
      own_pieces = []
      (0...grid.length).each do |row|
        (0...grid.length).each do |col|
          if color == grid[row][col].color
            own_pieces << grid[row][col]
          end
        end
      end
      own_pieces.all? { |piece| piece.valid_moves.empty? }
    end
  end
end
