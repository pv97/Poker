require "towers_of_hanoi"
require "rspec"

describe "Game" do
  let(:game) {Game.new}
  describe "initialize"  do
    it "initializes all discs on one stack" do
      expect(game.board).to eq([[1,2,3],[],[]])
    end

    it "moves correctly" do
      expect(game.move([0,1])).to eq([[2,3],[1],[]])
    end

    it "doesn't allow you to stack disks improperly" do
      expect(game.move([0,1])).to eq([[2,3],[1],[]])
      expect(game.move([0,1])).to eq("Can't move that way")
    end

    it "ends when the game is over" do
      game.board = [[],[],[1,2,3]]
      expect(game.win?).to be true 
    end

  end

end
