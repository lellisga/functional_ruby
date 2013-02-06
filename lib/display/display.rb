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
    grid[x][y] = value
    grid
  }

  Clear = ->(grid, y = 0, x = 0){
    return grid unless y < Height.(grid)
    if x < Wide.(grid)
      grid = Set.(grid, y, x, 0)
      Clear.(grid, y, x + 1)
    else
      Clear.(grid, y + 1 )
    end
  }

  Create_grid = ->(height, wide, grid = [], sub_grid = [], x = 0, y = 0){
    return grid unless y < height
    if x < wide
      Create_grid.(height, wide, grid, sub_grid << 0 , x + 1, y)
    else 
      Create_grid.(height, wide, grid << sub_grid, [], 0 , y + 1)
    end
  }

  Square = ->(grid, n, x = 0){
    return grid unless x < n
    grid = Set.(grid, 0, x, "*")
    grid = Set.(grid, x, 0, "*")
    grid = Set.(grid, n-1, x, "*")
    grid = Set.(grid, x, n-1, "*")
    Square.(grid, n, x + 1)
  }

  Print = ->(grid, y = 0){
    return unless y < Height.(grid)
    puts grid[y].join( " " )
    Print.(grid, y + 1)
  }
end
