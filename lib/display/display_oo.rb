class DisplayOO
  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def height
    grid.size
  end

  def wide
    grid[0].size
  end

  def get(x, y)
    grid[x][y]
  end

  def set(x, y, value)
    grid[x][y] = value
    grid
  end

  def clear
    x = 0
    while x < wide
      y = 0
      while y < height
        set(x, y, 0)
        y += 1
      end
      x += 1
    end
    grid
  end

  def square(n)
    x = 0
    value = "*"
    while x < n
      grid = set(0, x, value)
      grid = set(x, 0, value)
      grid = set(n-1, x, value)
      grid = set(x, n-1, value)
      x += 1
    end
    grid
  end

  def print
    y = 0
    while y < height
      p grid[y].join( " " )
      y += 1
    end
  end

  def self.create_grid(m, n)
    y = 0
    grid = []
    while y < m
      x = 0
      sub = []
      while x < n
        sub << 0
        x += 1
      end
      grid << sub
      y += 1
    end
    grid
  end
end
