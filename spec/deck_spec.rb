require "deck"
require "rspec"

describe "#initalize" do
  let (:deck) { Deck.new}
  let (:deck2) { Deck.new}
  SUITS = [:spades, :clubs, :hearts, :diamonds]
  VALUES = (2..14).to_a
  every_card = {}

  #Makes every combination of value,suit pair in a standard deck
  SUITS.each do |suit|
    VALUES.each do |value |
      every_card[[value, suit]] = true
    end
  end

  it "starts with 52 cards" do
    expect(deck.collection.length).to eq(52)
  end

  it "has all the correct values" do
    deck.collection.each do |card|
      every_card.delete([card.value,card.suit])
    end

    expect(every_card).to be_empty
  end

  it "doesn't have repeats" do
    repeats = []
    repeated = false
    deck.collection.each do |card|
      repeated = true if repeats.include?([card.value,card.suit])
      repeats << [card.value,card.suit]
    end

    expect(repeated).to be false
  end
end

describe "#shuffle!" do
  let (:deck) { Deck.new}
  let (:deck2) { Deck.new}

  it "is in random order" do
    expect(deck.shuffle!).to_not eq(deck2.shuffle!)
  end

end


# SUITS = [:spades, :clubs, :hearts, :diamonds]
# VALUES = (0..14).to_a
