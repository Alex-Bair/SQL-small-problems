require 'pry'

class Card
  attr_reader :rank, :suit
  SORTED_RANK = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other_card)
    SORTED_RANK.index(rank) <=> SORTED_RANK.index(other_card.rank)
  end

  def ==(other_card)
    rank == other_card.rank &&
    suit == other_card.suit
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
  
  def initialize
    @cards = []
    shuffle_cards
  end

  def draw
    shuffle_cards if @cards.empty?
    @cards.shift
  end
  
  private
  
  def shuffle_cards
    SUITS.each do |suit|
      RANKS.each do |rank|
        @cards << Card.new(rank, suit)
      end
    end
    
    @cards.shuffle!
  end
end



#examples
deck = Deck.new
drawn = []

52.times { drawn << deck.draw }

p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.