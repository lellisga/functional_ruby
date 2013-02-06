require 'spec_helper'

describe Display do
  let(:grid) do
    [[1, 2, 3], 
     [4, 5, 6], 
     [7, 8, 9]]
  end

  describe "#Set" do
    specify{ Display::Set.(grid, 0, 0, "li")[0][0].should eq "li" }
    specify{ Display::Set.(grid, 1, 1, "liz")[1][1].should eq "liz" }
    specify{ Display::Set.(grid, 2, 2, "dana")[2][2].should eq "dana" }

    it "returns an unmutable grid" do
     Display::Set.(grid, 0, 0, "li").should be_frozen
    end
  end

  describe "#clear" do
    it "Sets the grid values to zero" do
      result = Display::Clear.(grid)
      result.should == [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    end
  end

  describe "#Create_grid" do
    it "creates a mxn empty grid" do
      result = Display::Create_grid.(2,2)
      result.should == [[0, 0], [0, 0]]
    end
  end

  describe "#Square" do
    it "creates a square given a grid" do
      grid = Display::Create_grid.(3,3)
      result = Display::Square.(grid, 2) 
      result.should == [
        ["*", "*", 0], 
        ["*", "*", 0], 
        [  0,   0, 0]]
    end
  end
end
