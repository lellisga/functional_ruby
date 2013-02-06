require 'spec_helper'

describe DisplayOO do
  let(:grid) do
    [[1, 2, 3], 
     [4, 5, 6], 
     [7, 8, 9]]
  end

  subject { DisplayOO.new(grid) }

  describe "#height" do
    specify{ subject.height.should == 3 }
  end

  describe "#wide" do
    specify{ subject.wide.should == 3 }
  end

  describe "#get" do
    specify{ subject.get(0, 0).should eq 1 }
    specify{ subject.get(1, 1).should eq 5 }
    specify{ subject.get(2, 2).should eq 9 }
  end

  describe "#set" do
    specify{ subject.set(0, 0, "li")[0][0].should eq "li" }
    specify{ subject.set(1, 1, "liz")[1][1].should eq "liz" }
    specify{ subject.set(2, 2, "dana")[2][2].should eq "dana" }
  end

  describe "#clear" do
    it "sets the grid values to zero" do
      result = subject.clear
      result.should == [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
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
      result = dpo.square(2) 
      result.should == [
        ["*", "*", 0], 
        ["*", "*", 0], 
        [  0,   0, 0]]
    end
  end
end
