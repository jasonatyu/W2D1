require 'colorize'
require_relative 'board'
require_relative 'cursor'

class Display 
  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
  end

  def render 
    (0...8).each do |row|
      arr = []
      (0...8).each do |col|
        if @board[[row, col]].is_a?(NullPiece)
          arr << " "
        else
          arr << @board[[row, col]].value
        end
      end
      puts arr.join(" ")
    end
    nil
  end

end