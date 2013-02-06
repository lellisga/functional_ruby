class DisplayOO
  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  def clear
    wide.times do |x|
      height.times { |y| set(x, y, 0) }
    end
  end

  def square(n, value = "*")
    n.times do |x|
      set(0, x, value)
      set(x, 0, value)
      set(n-1, x, value)
      set(x, n - 1, value)
    end
  end

  def print
    (0...height).each { |y| puts grid[y].join " " }
  end

  def self.create_grid(m, n)
    Array.new.tap do |grid|
      m.times { grid << (0...n).each_with_object([]){ |_, ar| ar << 0 } }
    end
  end

  private

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
  end
end
