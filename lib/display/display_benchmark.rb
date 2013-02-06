require 'benchmark'
require_relative 'display'
require_relative 'display_oo'

grid_size = 40

grid_functional = Display::Create_grid.(grid_size, grid_size)
grid_oo = DisplayOO.create_grid(grid_size, grid_size)

Benchmark.bm(7) do |x|
  x.report("Functional") { Display::Square.(grid_functional, grid_size) }
  x.report("OO") { DisplayOO.new(grid_oo).square(grid_size) }
end
