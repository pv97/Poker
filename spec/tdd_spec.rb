require "tdd"
require "rspec"

describe "#uniq"do
  it "correctly removes duplicates" do
    expect([1,1,2,3].my_uniq).to eq([1,2,3])
  end
  it "doesn't modifty a non duplicate array" do
    expect([1,2,3].my_uniq).to eq([1,2,3])
  end
  it "doesn't modifty a non duplicate array" do
      expect([1,2,3].my_uniq).to eq([1,2,3])
    end
  it "handles empty arrays" do
    expect([].my_uniq).to eq([])
  end
end

describe "#two_sum" do
  it "doesn't sum two indices which don't add to two" do
    expect([-2, 0, 4].two_sum).to eq([])
  end

  it "correctly returns two indices which sum to zero" do
    expect([-2, 2, 5].two_sum).to eq([[0,1]])
  end

  it "correctly orders two indices, mutliptle times" do
    expect([0,0,0].two_sum).to eq([[0,1], [0,2], [1,2]])
  end

end

describe "#my_transpose" do
  it "doesn't modify empty arrays" do
    expect([[]].my_transpose).to eq([[]])
  end

  it "correctly transposes a 2x2 matrix" do
    expect([[0,1],[2,3]].my_transpose).to eq([[0,2],[1,3]])
  end

  it "correctly transposes a 3x3 matrix" do
    expect([[0,1,2],[3,4,5],[6,7,8]].my_transpose).to eq([[0,3,6],[1,4,7],[2,5,8]])
  end

  describe "#stock_picker" do
    it "doesn't sell stock before it is bought" do
      test = [100,45,2,12,56].stock_picker
      expect(test[0]>test[1]).to be false
    end

    it "buys low sells high" do
      expect([2,45,56,12,3].stock_picker).to eq([0,2])
    end
  end



end
