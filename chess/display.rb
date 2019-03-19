require 'colorize'
require_relative 'board'
require_relative 'cursor'

class Display 
  def initialize(board)
    @cursor = Cursor.new([0,0], board)
    @board = board
    render
  end

  def render 
    @cursor.get_input
    system("clear")
    (0...8).each do |row|
      arr = []
      (0...8).each do |col|
        if @board[[row, col]].is_a?(NullPiece)
          if @cursor.cursor_pos == [row, col]
            arr << "*".to_s.colorize(:green)
          else 
            arr << " "
          end
        else
          if @cursor.cursor_pos == [row, col]
            arr << @board[[row, col]].symbol.to_s.colorize(:green)
          else 
            arr << @board[[row, col]].symbol
          end
        end
      end
      puts arr.join(" ")
    end
    render
  end
end

b = Board.new 
d = Display.new(b)