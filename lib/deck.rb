# SUITS = [:spades, :clubs, :hearts, :diamonds]
# VALUES = ["2","3","4","5","6","7","8","9","10","J", "Q","K", "A"]
# def populate
# SUITS.each do |suit|
#   VALUES.each do |value|
#   @our_deck << Card.new(value, suit)
# end
# end

require_relative 'card'

class Deck


  SUITS = [:spades, :clubs, :hearts, :diamonds]
  VALUES = (2..14).to_a

  attr_accessor :collection
  def initialize
    @collection = []
    populate
    shuffle!
  end

  def populate
  SUITS.each do |suit|
    VALUES.each do |value|
      @collection << Card.new(value, suit)
      end
    end
  end

  def shuffle!
    @collection = @collection.shuffle
  end


end
