require_relative 'hand'

class Player

  attr_accessor :pot, :hand, :total_bet
  attr_reader :name

  def initialize(name= "Johnny", pot=1_000_000)
    @name = name
    @pot = pot
    @hand = Hand.new
    @total_bet = 0
  end

  def get_discard
    input = nil
    until input == ("y" || "n")
      puts "Do you want to discard any cards?"
      input = gets.chomp
    end

    discarded = []

    if input == "y"
      until valid_input?(discarded)
        discarded = gets.chomp.split(",").map(&:to_i)
      end
    end

    discarded.each do |index|
      @hand.discard(@hand.keys[index])
    end


    return discarded.length
  end

  def render
    @hand.cards.keys.each do |card|
      puts "[#{card.face} #{card.suit}]"
    end
  end

  def valid_input?(input)
    return false if input.nil?
    return false if input.uniq != input
    input.all?{|num| (0..4).include?(num)}
  end

  def get_decision
    decision = nil
    while decision != ("b" || "f" || "c")
      puts "Do you want to bet, fold, or check?"
      decision = gets.chomp
    end

    if decision == "b"
      return :bet
    elsif decision == "f"
      return :fold
    elsif decision == "c"
      return :check
    end
  end

  def get_bet
    puts "Make a bet"
    our_bet = gets.chomp
    while @pot - our_bet.to_i < 0
      "That bet is invalid, you have #{@pot} money left!"
      our_bet = gets.chomp
    end
    @pot -= our_bet.to_i
    @total_bet += our_bet.to_i
    our_bet.to_i
  end

  def get_paid(cash)
    @pot += cash
  end

end
