class House
  include Comparable
  attr_reader :price

  def initialize(price)
    @price = price
  end
  
  def <=>(other_house)
    price <=> other_house.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2
puts "Home 2 is more expensive" if home2 > home1

=begin
Expected output:
Home 1 is cheaper
Home 2 is more expensive
=end

=begin
Further Exploration:

This technique to compare House objects isn't necessarily a good one. There are multiple ways and criteria used to compare house (number of bedrooms, number of bathrooms, size, number of floors, unfinished/finished basement, etc.).
If we compare homes directly and expect the comparison to be the price, then we are ok with the above implementation. But if we want to compare other attributes, then the above implementation is not clear and may create confusion if the user thinks comparing homes actually compares their size instead of price.

Including Comparable is a good idea if there is only a single attribute that would make sense to compare.

=end