class DisplayFunctional
  class << self
    def height(grid)
      grid.size
    end

    def wide(grid)
      grid[0].size
    end

    def get(grid, x, y)
      grid[x][y]
    end

    def set(grid, x, y, value)
      grid[x][y] = value
      grid
    end

    def clear(grid, y = 0, x = 0)
      return grid unless y < height(grid)
      if x < wide(grid)
        grid = set(grid, y, x, 0)
        return clear(grid, y, x + 1)
      end
      return clear(grid, y + 1 )
    end

    def create_grid(height, wide, grid = [], sub_grid = [], x = 0, y = 0)
      return grid unless y < height
      return create_grid(height, wide, grid, sub_grid << 0 , x + 1, y) if x < wide
      return create_grid(height, wide, grid << sub_grid, [], 0 , y + 1)
    end

    def square(grid, n, x = 0)
      return grid unless x < n
      grid = set(grid, 0, x, "*")
      grid = set(grid, x, 0, "*")
      grid = set(grid, n - 1, x, "*")
      grid = set(grid, x, n - 1, "*")
      return square(grid, n, x + 1)
    end 

    def print(grid, y = 0)
      return unless y < height(grid)
      puts grid[y].join " "
      return print(grid, y + 1)
    end
  end
end
