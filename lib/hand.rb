require_relative "card"


class Hand
  attr_accessor :cards

  def initialize
    @cards = {}
  end

  def take_card(card)
    @cards[card] = true
  end

  def discard(card)
    raise ArgumentError if @cards[card].nil?
    @cards.delete(card)
  end

  def hand_value
    if straight? && flush?
      return 800 + high_card
    elsif of_a_kind?(4)
      return 700 + high_card
    elsif full_house?
      return 600 + high_card
    elsif flush?
      return 500 + high_card
    elsif straight?
      return 400 + high_card
    elsif of_a_kind?(3)
      return 300 + high_card
    elsif two_pair?
      return 200 + high_card
    elsif of_a_kind?(2)
      return 100 + high_card
    else
      return high_card
    end
  end

  def flush?
    same_suit = []
    @cards.keys.each do |card|
      same_suit << card.suit
    end
    same_suit.uniq.length == 1
  end

  def full_house?
    full_house = Hash.new(0)
    @cards.keys.each do |card|
      full_house[card.value] += 1
      return false if full_house.keys.length > 2
    end
    true
  end

  def straight?
    in_a_row = []
    @cards.keys.each do |card|
      in_a_row << card.value
    end
    sorted_cards = in_a_row.sort
    sorted_cards.each_with_index do |value,i|
      next if sorted_cards[i+1].nil?
      return false if sorted_cards[i+1] - sorted_cards[i] != 1
    end
    true
  end

  def two_pair?
    two_pair = Hash.new(0)
    @cards.keys.each do |card|
      two_pair[card.value] += 1
      return false if two_pair.keys.length > 3
    end
    true
  end

  def of_a_kind?(n)
    same_value = Hash.new(0)
    @cards.keys.each do |card|
      same_value[card.value] += 1
      return true if same_value[card.value] == n
    end
    false
  end

  def high_card
    highest = 0
    @cards.keys.each do |card|
      highest = card.value if card.value > highest
    end
    highest
  end
end
