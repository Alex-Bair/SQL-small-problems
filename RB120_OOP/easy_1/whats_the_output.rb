class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    @name.upcase!
    "My name is #{@name}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name # Fluffy
puts fluffy # My name is FLUFFY.
puts fluffy.name #FLUFFY
puts name #FLUFFY

=begin

To fix this class, we will avoid mutating the object referenced by instance variable @name and local variable name.

=end

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name # Fluffy
puts fluffy # My name is FLUFFY.
puts fluffy.name #Fluffy
puts name #Fluffy

#Further Exploration

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name #42
puts fluffy #My name is 42.
puts fluffy.name #42
puts name #43

=begin

The above code prints:
42
My name is 42
42
43

On line 49, we instantiate a new Pet object and pass in local variable name (currently pointing to the Integer 42) as an argument. The Pet#initialize method assigns the instance variable @name to the string representation of the passed in argument - '42'. This new Pet object is assigned to local variable fluffy.
On line 50, the local variable name's object is incremented by 1. Local variable name now points to the Integer 43.
On line 51, we call the #puts method and pass in the return value of calling Pet#name on the fluffy object. The instance variable @name references '42', so '42' is output to the screen.
On line 52, we call the #puts method and pass in the fluffy object as an argument. The #puts method automatically calls the argument object's #to_s method on the argument before outputting to the screen. This outputs the return value of fluffy.to_s, which is "My name is 42."
On line 53, we call the #puts method and pass in the return value of calling Pet#name on the fluffy object. The instance variable @name references '42', so '42' is output to the screen.
On line 54, we call the #puts method and pass in the object referenced by local variable name as an argument. Local variable name references the integer 43, so a string representation of 43, '43', is output to the screen.

=end