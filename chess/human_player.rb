require_relative 'cursor'
require_relative 'board'

class HumanPlayer
  def initialize(pos, board)
    @cursor = Cursor.new(pos, board)
  end

  def make_move 
    response = @cursor.get_input
    if response.nil?
      make_move
    else 
      response
    end
  end
end