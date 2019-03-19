module Slideable
  def valid_moves
    if move_dirs == 'horizontal'
      horizontal_dirs
    elsif move_dirs == 'diagonal'
      diagonal_dirs
    elsif move_dirs == 'both'
      horizontal = horizontal_dirs
      diagonal = diagonal_dirs
      horizontal + diagonal
    end
  end

  def horizontal_dirs
    res = []
    x, y = pos 

    up = 1 
    while Board.valid_pos?([x + up , y]) 
      if @board[[x + up, y]].is_a?(NullPiece)
        res << [x + up, y]
        up += 1
      elsif @board[[x + up, y]].color != self.color  
        res << [x + up, y]
        break
      else
        break
      end
    end

    down = 1 
    while Board.valid_pos?([x - down , y]) 
      if @board[[x - down, y]].is_a?(NullPiece)
        res << [x - down, y]
        down += 1
      elsif @board[[x - down, y]].color != self.color  
        res << [x - down, y]
        break
      else
        break
      end
    end

    left = 1 
    while Board.valid_pos?([x , y - left]) 
      if @board[[x , y - left]].is_a?(NullPiece)
        res << [x , y - left]
        left += 1
      elsif @board[[x , y - left]].color != self.color  
        res << [x , y - left]
        break
      else
        break
      end
    end

    right = 1 
    while Board.valid_pos?([x , y + right]) 
      if @board[[x , y + right]].is_a?(NullPiece)
        res << [x , y + right]
        right += 1 
      elsif @board[[x , y + right]].color != self.color  
        res << [x , y + right]
        break
      else
        break
      end
    end
    res
  end

  def diagonal_dirs
    res = []
    x, y = pos

    up_and_left = 1 
    while Board.valid_pos?([x + up_and_left , y - up_and_left]) 
      if @board[[x + up_and_left, y - up_and_left]].is_a?(NullPiece)
        res << [x + up_and_left, y - up_and_left]
        up_and_left += 1
      elsif @board[[x + up_and_left, y - up_and_left]].color != self.color  
        res << [x + up_and_left, y - up_and_left]
        break
      else
        break
      end
    end

    up_and_right = 1 
    while Board.valid_pos?([x + up_and_right , y + up_and_right]) 
      if @board[[x + up_and_right, y + up_and_right]].is_a?(NullPiece)
        res << [x + up_and_right, y + up_and_right]
        up_and_right += 1
      elsif @board[[x + up_and_right, y + up_and_right]].color != self.color  
        res << [x + up_and_right, y + up_and_right]
        break
      else
        break
      end
    end

    down_and_left = 1 
    while Board.valid_pos?([x - down_and_left , y - down_and_left]) 
      if @board[[x - down_and_left , y - down_and_left]].is_a?(NullPiece)
        res << [x - down_and_left , y - down_and_left]
        down_and_left += 1
      elsif @board[[x - down_and_left , y - down_and_left]].color != self.color  
        res << [x - down_and_left , y - down_and_left]
        break
      else
        break
      end
    end

    down_and_right = 1 
    while Board.valid_pos?([x - down_and_right , y + down_and_right]) 
      if @board[[x - down_and_right , y + down_and_right]].is_a?(NullPiece)
        res << [x - down_and_right , y + down_and_right]
        down_and_right += 1 
      elsif @board[[x - down_and_right , y + down_and_right]].color != self.color  
        res << [x - down_and_right , y + down_and_right]
        break
      else
        break
      end
    end
    res
  end 

end