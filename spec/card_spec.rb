require "card"
require "rspec"

describe "#initalize" do
  let (:card) {Card.new(7,:spade)}
  it "initializes properly" do
    expect(card.value).to eq(7)
    expect(card.suit).to eq(:spade)
  end

  it "raises an error if not passed any arguments" do
    expect {Card.new()}.to raise_error(ArgumentError)
  end
end

describe "#face" do
  let (:card) {Card.new(7,:spade)}
  let (:card2) {Card.new(14,:spade)}
  let (:card3) {Card.new(12,:spade)}

  it "Shows the correct face" do
    expect(card.face).to eq("7")
  end

  it "Shows multiple correct faces" do
    expect(card.face).to eq("7")
    expect(card2.face).to eq("A")
    expect(card3.face).to eq("Q")
  end

end
