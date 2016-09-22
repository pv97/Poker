class Card
  attr_reader :value, :suit

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def face
    if value <= 10
      @value.to_s
    else
      case @value
      when 11
        "J"
      when 12
        "Q"
      when 13
        "K"
      when 14
        "A"
      end
    end
  end

end
