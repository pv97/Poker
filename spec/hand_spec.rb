require "hand"
require "rspec"
require "card"

describe "#initalize" do

  let(:hand) { Hand.new }

  it "should begin empty" do
    expect(hand.cards).to eq({})
  end
end

describe "#take_card" do

  let(:hand) { Hand.new }
  let(:card) { double("7spade", :value => "7",:suit => :spade)}
  let(:card2) { double("Aspade", :value => "A",:suit => :spade)}


  it "should take a card" do
    hand.take_card(card)
    expect(hand.cards).to eq(card => true)
  end

  it "should take a second card" do
    hand.take_card(card)
    hand.take_card(card2)
    expect(hand.cards).to eq(card => true, card2 => true)
  end

  it "shouldn't take a card it has" do
    hand.take_card(card)
    hand.take_card(card)
    expect(hand.cards).to eq(card => true)
  end
end

describe "#discard" do
  let(:hand) { Hand.new }
  let(:card) { double("7spade", :value => 7,:suit => :spade)}
  let(:card2) { double("Aspade", :value => 14,:suit => :spade)}
  let(:card3) { double("Kclubs", :value => 13,:suit => :clubs)}
  let(:card4) { double("3hearts", :value => 3,:suit => :hearts)}
  let(:card5) { double("Ahearts", :value => 14,:suit => :hearts)}

  before(:each) do
    hand.take_card(card)
    hand.take_card(card2)
    hand.take_card(card4)
    hand.take_card(card5)
  end

  it "shouldn't discard a card it doesn't have" do
    expect {hand.discard(card3)}.to raise_error(ArgumentError)
  end

  it "discards a card it has" do
    hand.discard(card2)
    expect(hand.cards).to eq(card => true, card4 => true, card5 => true )
  end

  it "discards multiple cards" do
    hand.discard(card)
    hand.discard(card2)
    expect(hand.cards).to eq(card4 => true, card5 => true )
  end


  it "doesn't discards more than 3 cards" do
    expect {hand.discard(card,card2,card4,card5)}.to raise_error(ArgumentError)
  end
end

describe "#hand_value" do
  let(:hand) { Hand.new }
  it "returns the high card, when that is the best value" do
    hand.cards = {
      Card.new(14, :spade)=> true,
      Card.new(10, :hearts)=> true,
      Card.new(3, :diamonds)=> true,
      Card.new(8, :spade)=> true,
      Card.new(9, :spade)=> true
      }
      expect(hand.hand_value).to eq(14)
  end

  it "returns the value of pair, when that is the best value" do
    hand.cards = {
      Card.new(14, :spade)=> true,
      Card.new(10, :hearts)=> true,
      Card.new(14, :diamonds)=> true,
      Card.new(8, :spade)=> true,
      Card.new(9, :spade)=> true
      }
      expect(hand.hand_value).to eq(114)
  end

  it "returns the value of two pair, when that is the best value" do
    hand.cards = {
      Card.new(14, :spade)=> true,
      Card.new(14, :hearts)=> true,
      Card.new(9, :diamonds)=> true,
      Card.new(8, :spade)=> true,
      Card.new(9, :spade)=> true
      }
      expect(hand.hand_value).to eq(214)
  end

  it "returns the value of three pair, when that is the best value" do
    hand.cards = {
      Card.new(14, :spade)=> true,
      Card.new(14, :hearts)=> true,
      Card.new(14, :diamonds)=> true,
      Card.new(8, :spade)=> true,
      Card.new(9, :spade)=> true
      }
      expect(hand.hand_value).to eq(314)
  end

  it "returns the value of straight, when that is the best value" do
    hand.cards = {
      Card.new(14, :spade)=> true,
      Card.new(13, :hearts)=> true,
      Card.new(12, :diamonds)=> true,
      Card.new(11, :spade)=> true,
      Card.new(10, :spade)=> true
      }
      expect(hand.hand_value).to eq(414)
  end

  it "returns the value of flush, when that is the best value" do
    hand.cards = {
      Card.new(14, :spade)=> true,
      Card.new(2, :spade)=> true,
      Card.new(12, :spade)=> true,
      Card.new(3, :spade)=> true,
      Card.new(10, :spade)=> true
      }
      expect(hand.hand_value).to eq(514)
  end

  it "returns the value of full house, when that is the best value" do
    hand.cards = {
      Card.new(14, :spade)=> true,
      Card.new(2, :hearts)=> true,
      Card.new(14, :diamonds)=> true,
      Card.new(2, :clubs)=> true,
      Card.new(2, :spade)=> true
      }
      expect(hand.hand_value).to eq(614)
  end

  it "returns the value of 4 of a kind, when that is the best value" do
    hand.cards = {
      Card.new(14, :spade)=> true,
      Card.new(14, :hearts)=> true,
      Card.new(14, :diamonds)=> true,
      Card.new(14, :clubs)=> true,
      Card.new(2, :spade)=> true
      }
      expect(hand.hand_value).to eq(714)
  end

  it "returns the value of a straight flush, when that is the best value" do
    hand.cards = {
      Card.new(12, :spade)=> true,
      Card.new(11, :spade)=> true,
      Card.new(10, :spade)=> true,
      Card.new(9, :spade)=> true,
      Card.new(8, :spade)=> true
      }
      expect(hand.hand_value).to eq(812)
  end
end
