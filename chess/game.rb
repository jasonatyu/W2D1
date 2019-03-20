require_relative 'board'
require_relative 'display'
require_relative 'human_player'

class Game 
  attr_reader :current_player

  def initialize
    @board = Board.new 
    @player1 = HumanPlayer.new([0,0], @board)
    @player2 = HumanPlayer.new([0,0], @board)
  end

  def play 
    end_pos = current_player.make_move 
  end

end