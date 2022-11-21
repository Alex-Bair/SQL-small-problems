class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
  
  private
  
  attr_reader :name, :age
end

class Cat < Pet
  def initialize(name, age, color)
    super(name, age)
    @color = color
  end
  
  def to_s
    "My cat #{name} is #{age} years old and has #{color} fur."
  end
  
  private
  
  attr_reader :color
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

=begin
Expected output:
My cat Pudding is 7 years old and has black and white fur.
My cat Butterscotch is 10 years old and has tan and white fur.
=end

=begin
Further Exploration:

We would be able to omit the Cat#initialize method because the instance variables we need (name, age, color) would all be provided and initialized in the Pet#initialize method.
Whether or not this is a good idea depends on a variety of factors.
  - Do you anticipate that all Pets will have a color?
  - Have you already used the existing Pets class elsewhere and requiring a color would disrupt the code? If so, would it be ok to use a default value for a Pet's color?

=end