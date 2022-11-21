class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new('Black')
cat1.color

=begin

Method lookup path for the #color method call on the cat1 object:
Cat
Animal (#color getter method exists in the Animal class)

=end