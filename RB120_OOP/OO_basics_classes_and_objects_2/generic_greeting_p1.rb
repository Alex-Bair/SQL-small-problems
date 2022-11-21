class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

Cat.generic_greeting
kitty = Cat.new

#Further Exploration
kitty.class.generic_greeting
=begin
Running `kitty.class.generic_greeting` executes the class method Cat.generic_greeting.
This is because we are chaining methods. `kitty.class` returns the class `Cat`. 
Calling `generic_greeting` on the `Cat` class runs the class method `Cat.generic_greeting`.
=end