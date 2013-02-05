require 'spec_helper'

describe Display do
  describe "#get_index" do
    specify{ subject.get_index(0, 0).should eq 1 }
    specify{ subject.get_index(1, 1).should eq 5 }
    specify{ subject.get_index(2, 2).should eq 9 }
  end

  describe "#clear" do
    it "sets the grid values to zero" do
      subject.clear
      Display::GRID.should == [[0, 0, 0], [0, 0, 0], [0, 0, 0]]
    end
  end

  describe "#set_character" do
    it "sets the character l to the grid" do
      subject.set_character("l")
      Display::GRID.should == [[1, 0, 0], [1, 0, 0], [1, 0, 0]]
    end
  end
end
