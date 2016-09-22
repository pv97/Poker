require_relative "hand"
require_relative "deck"
require_relative "card"
require_relative "player"
require 'byebug'

class Game
  attr_accessor :deck, :betting_pot, :players

  def initialize(*players)
    @players = players
    @deck = Deck.new
    @betting_pot = 0
    @total_bet = 0
    @played_players = []
    @players_in_game = @players
    deal_cards
  end

  def current_player
    @players_in_game[0]
  end

  def switch_player!
    @played_players << @players_in_game.shift
  end

  def take_discard_turn(player)
    number_of_discards = player.get_discard
    number_of_discards.times do
      give_card(player)
    end
  end

  def take_turn

    current_player.render
    decision = current_player.get_decision
    case decision
    when :bet
      current_bet = current_player.get_bet
      current_total_bet = current_player.total_bet

      @betting_pot += current_bet
      @players_in_game += @played_players if current_total_bet > @total_bet
      @total_bet = current_total_bet if current_total_bet > @total_bet
    when :fold

    when :check
      if @betting_pot > 0
        while decision != (:fold||:bet)
          puts "You can't check, there is money in the pot!"
          decision = current_player.get_decision
        end
      end

    end
  end

  def play
    while @players_in_game.length > 0
      take_turn
      switch_player!
    end
    @players_in_game += @played_players
    @players_in_game.each do |player|
      take_discard_turn(player)
    end
    while @players_in_game.length > 0
      take_turn
      switch_player!
    end
    winner
  end

  def deal_cards
    @players.each do |player|
      until player.hand.cards.keys.length == 5
        give_card(player)
      end
    end
  end

  def winner
    highest_score = 0
    best_player = nil
    @played_players.each do |player|
      highest_score = player.hand.hand_value if player.hand.hand_value > highest_score
      best_player = player if player.hand.hand_value > highest_score
    end
    best_player.get_paid(@betting_pot)
    @betting_pot = 0
    puts "#{best_player} wins with a score of #{highest_score}"
  end


  def give_card(player)
    card = @deck.collection.shift
    player.hand.take_card(card)
  end
end


g = Game.new(Player.new("Connor"), Player.new("Pi"))
g.play
