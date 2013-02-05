class Display
  GRID = [
    [1, 2, 3], 
    [4, 5, 6], 
    [7, 8, 9]]

  def height; 2 end
  def wide; 2 end

  CHARS = {
    l: [[0,2]]
  }

  def clear()
    clr = ->(){
      temp_x = 0
      while temp_x <= wide
        temp_y = 0
        while temp_y <= height
          set(temp_x, temp_y, 0)
          temp_y = temp_y + 1
        end
        temp_x = temp_x + 1
      end
    }
    clr.()
  end

  def get(x, y)
    get = ->(x, y) {
      GRID[x][y]
    }
    get.(x,y)
  end

  def set(x, y, value)
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
          set(temp,0, 1)
          temp = temp + 1
        end
      end
    }
    set_char.(character)
  end
end
