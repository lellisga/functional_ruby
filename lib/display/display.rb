module Display
  Height = ->(grid){
    grid.size
  }

  Wide = ->(grid){
    grid[0].size
  }

  Get = ->(grid, x, y){
    grid[x][y]
  }

  Set = ->(grid, x, y, value){
    row = grid[x].dup
    row[y] = value
    new_grid = grid.dup
    new_grid[x] = row
    new_grid.freeze
  }

  Clear = ->(grid, y = 0, x = 0){
    return grid unless y < Height.(grid)
    if x < Wide.(grid)
      grid = Set.(grid, y, x, 0)
      return Clear.(grid, y, x + 1)
    end
    return Clear.(grid, y + 1 )
  }

  Create_grid = ->(height, wide, grid = [], sub_grid = [], x = 0, y = 0){
    return grid unless y < height
    return Create_grid.(height, wide, grid, sub_grid << 0 , x + 1, y) if x < wide
    return Create_grid.(height, wide, grid << sub_grid.freeze, [], 0 , y + 1)
  }

  Square = ->(grid, n, x = 0){
    return grid unless x < n
    grid = Set.(grid, 0, x, "*")
    grid = Set.(grid, x, 0, "*")
    grid = Set.(grid, n - 1, x, "*")
    grid = Set.(grid, x, n - 1, "*")
    return Square.(grid, n, x + 1)
  }

  Print = ->(grid, y = 0){
    return unless y < Height.(grid)
    puts grid[y].join " "
    return Print.(grid, y + 1)
  }
end
