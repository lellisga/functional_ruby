GRID =
  [1, 2, 3], 
  [4, 5, 6], 
  [7, 8, 9]

height = 2
wide = 2

CHARS = {
  l: [[0,2]]
}

get = ->(x, y){
  GRID[x][y]
}

set = ->(x, y, value){
  GRID[x][y] = value
}

clear = ->(){
  temp_x = 0
  while temp_x <= wide
    temp_y = 0
    while temp_y <= height
      set.(temp_x, temp_y, 0)
      temp_y = temp_y + 1
    end
    temp_x = temp_x + 1
  end
}

set_char = ->(character){
  clear.()
  CHARS[character.to_sym].each do |range|
    temp = range[0]
    while temp <= range[1]
      set.(temp, 0, 1)
      temp = temp + 1
    end
  end
}

# puts GRID
# [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
# clear.()
# puts GRID
# [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
