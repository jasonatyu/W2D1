module Stepable
  def valid_moves 
    res = []
    x, y = pos
    move_diffs.each do |diff|
      a, b = diff 
      if Board.valid_pos?([x + a, y + b])
        if @board[[x + a, y + b]].is_a?(NullPiece)
          res << [x + a, y + b]
        elsif @board[[x + a, y + b]].color != self.color
          res << [x + a, y + b]
        end
      end
    end 
    res
  end
end