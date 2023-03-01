require 'pry'

# class Card
#   attr_reader :rank, :suit
#   SORTED_RANK = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']

#   def initialize(rank, suit)
#     @rank = rank
#     @suit = suit
#   end

#   def <=>(other_card)
#     SORTED_RANK.index(rank) <=> SORTED_RANK.index(other_card.rank)
#   end

#   def ==(other_card)
#     rank == other_card.rank &&
#     suit == other_card.suit
#   end

#   def to_s
#     "#{rank} of #{suit}"
#   end
# end


#Examples
# cards = [Card.new(2, 'Hearts'),
#         Card.new(10, 'Diamonds'),
#         Card.new('Ace', 'Clubs')]
# puts cards
# puts cards.min == Card.new(2, 'Hearts')
# puts cards.max == Card.new('Ace', 'Clubs')

# cards = [Card.new(5, 'Hearts')]
# puts cards.min == Card.new(5, 'Hearts')
# puts cards.max == Card.new(5, 'Hearts')

# cards = [Card.new(4, 'Hearts'),
#         Card.new(4, 'Diamonds'),
#         Card.new(10, 'Clubs')]
# puts cards.min.rank == 4
# puts cards.max == Card.new(10, 'Clubs')

# cards = [Card.new(7, 'Diamonds'),
#         Card.new('Jack', 'Diamonds'),
#         Card.new('Jack', 'Spades')]
# puts cards.min == Card.new(7, 'Diamonds')
# puts cards.max.rank == 'Jack'

# cards = [Card.new(8, 'Diamonds'),
#         Card.new(8, 'Clubs'),
#         Card.new(8, 'Spades')]
# puts cards.min.rank == 8
# puts cards.max.rank == 8

#LS Solution

#Question - what #== method is the LS solution using when comparing cards? I expect the Comparable#== method (which uses the receiver's #<=> method to determine equality), but that's not the case.

# class Card
#   include Comparable
#   attr_reader :rank, :suit

#   VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }

#   def initialize(rank, suit)
#     @rank = rank
#     @suit = suit
#   end

#   def to_s
#     "#{rank} of #{suit}"
#   end

#   def value
#     VALUES.fetch(rank, rank)
#   end

#   def <=>(other_card)
#     value <=> other_card.value
#   end
# end


# Further Exploration

class Card
  attr_reader :rank, :suit
  SORTED_RANK = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']
  SORTED_SUIT = ['Diamonds', 'Clubs', 'Hearts', 'Spades']

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other_card)
    if rank_order(other_card).zero?
      suit_order(other_card)
    else
      rank_order(other_card)
    end
  end

  def rank_order(other_card)
    SORTED_RANK.index(rank) <=> SORTED_RANK.index(other_card.rank)
  end
  
  def suit_order(other_card)
    SORTED_SUIT.index(suit) <=> SORTED_SUIT.index(other_card.suit)
  end

  def ==(other_card)
    rank == other_card.rank &&
    suit == other_card.suit
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

cards = [Card.new(4, 'Hearts'),
        Card.new(5, 'Diamonds'),
        Card.new(4, 'Clubs')]
puts cards
puts cards.min == Card.new(4, 'Clubs')
puts cards.max == Card.new(5, 'Diamonds')