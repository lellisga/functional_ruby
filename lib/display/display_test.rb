class Display
  GRID = [
    [1, 2, 3], 
    [4, 5, 6], 
    [7, 8, 9]]

  CHARS = {
    l: [[0,2]]
  }

  def height; 2 end
  def wide; 2 end

  def clear()
    clr = ->(){
      temp_x = 0
      while temp_x <= wide
        temp_y = 0
        while temp_y <= height
          GRID[temp_x][temp_y] = 0
          temp_y = temp_y + 1
        end
        temp_x = temp_x + 1
      end
    }
    clr.()
  end

  def get_index(x, y)
    index = ->(x, y) {
      GRID[x][y]
    }
    index.(x,y)
  end

  def set_value(x, y, value)
    set = ->(x, y, value){
      GRID[x][y] = value
    }
    set.(x, y, value)
  end

  def set_character(character)
    set_char = ->(character){
      clear()
      CHARS[character.to_sym].each do |range|
        temp = range[0]
        while temp <= range[1]
          set_value(temp,0, 1)
          temp = temp + 1
        end
      end
    }
    set_char.(character)
  end
end
