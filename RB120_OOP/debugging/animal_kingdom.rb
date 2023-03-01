=begin

The SongBird#initialize method requires three arguments. However, the SongBird#initialize method uses the super keyword to leverage the Animal#initialize methods, which requires exactly 2 arguments.
When a new SongBird object is instantiated, this causes an argument error. To fix this, the super keyword in the SongBird#initialize method should specify which two parameters get passed up to the Animal#initialize method.

=end

class Animal
  def initialize(diet, superpower)
    @diet = diet
    @superpower = superpower
  end

  def move
    puts "I'm moving!"
  end

  def superpower
    puts "I can #{@superpower}!"
  end
end

class Fish < Animal
  def move
    puts "I'm swimming!"
  end
end

class Bird < Animal
end

class FlightlessBird < Bird
  def initialize(diet, superpower)
    super
  end

  def move
    puts "I'm running!"
  end
end

class SongBird < Bird
  def initialize(diet, superpower, song)
    super(diet, superpower)
    @song = song
  end

  def move
    puts "I'm flying!"
  end
end

# Examples

unicornfish = Fish.new(:herbivore, 'breathe underwater')
penguin = FlightlessBird.new(:carnivore, 'drink sea water')
robin = SongBird.new(:omnivore, 'sing', 'chirp chirrr chirp chirp chirrrr')

#Further Exploration
=begin

The FlightlessBird#initialize method is not necessary since it is only using the super keyword to leverage the Animal#initialize method. If the FlightlessBird#initialize method did not exist, the Animal#initialize method would be still be called on instantiation.

=end