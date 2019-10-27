class Card
  attr_reader :suit, :rank

  class << self
    def build suit, rank
      new suit: suit, rank: rank
    end
  end

  private_class_method :new
  def initialize suit:, rank:
    @suit = suit

    @rank = case rank
            when :jack then 11
            when :queen then 12
            when :king then 13
            else rank
            end
  end


  def ==(other)
    suit == other.suit && rank == other.rank
  end

  def hash
    [suit, rank].hash
  end

  def eql?(other)
    self == other
  end
end
