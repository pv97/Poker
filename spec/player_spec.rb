require "player"
require "rspec"
require "hand"

describe "#initalize" do
  let(:player) {Player.new}
  it "correctly adds a name and pot" do
    expect(player.name).to eq("Johnny")
    expect(player.pot).to be(1_000_000)
  end

  it "doesnt accept too many arguments" do
    expect{Player.new(1,2,3,4)}.to raise_error(ArgumentError)
  end

  it "correctly accepts a name and pot" do
    player = Player.new("Tim",999999999999999)
    expect(player.name).to eq("Tim")
    expect(player.pot).to be(999999999999999)
  end
end

describe "#get_paid" do
  let(:player) {Player.new}
  it "correctly gets paid" do
    player.get_paid(10)
    expect(player.pot).to be(1_000_010)
  end
end
