require 'spec_helper'

describe DisplayOO do
  let(:grid) do
    [[1, 2, 3], 
     [4, 5, 6], 
     [7, 8, 9]]
  end

  subject { DisplayOO.new(grid) }

  describe "#clear" do
    it "sets the grid values to zero" do
      subject.clear
      subject.grid.should == [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    end
  end

  describe ".create_grid" do
    it "creates a new grid" do
      result = DisplayOO.create_grid(3,3)
      result.should == [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    end
  end

  describe "#Square" do
    it "creates a square given a grid" do
      grid = DisplayOO.create_grid(3,3)
      dpo = DisplayOO.new(grid)
      dpo.square(2)
      dpo.grid.should == [
        ["*", "*", 0], 
        ["*", "*", 0], 
        [  0,   0, 0]]
    end
  end
end
