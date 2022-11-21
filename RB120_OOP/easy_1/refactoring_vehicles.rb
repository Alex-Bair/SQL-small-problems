class Vehicle
  attr_reader :make, :model
  WHEELS = 0
  
  def initialize(make, model)
    @make = make
    @model = model
  end
  
  def to_s
    "#{make} #{model}"
  end
  
  def wheels
    self.class::WHEELS
  end
end

class Car < Vehicle
  WHEELS = 4
end

class Motorcycle < Vehicle
  WHEELS = 2
end

class Truck < Vehicle
  WHEELS = 6
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end
end

truck = Truck.new('chev', 'taho', 'pay')
car = Car.new('chev', 'malibu')
bike = Motorcycle.new('har', 'moto')

p truck.wheels
p car.wheels
p bike.wheels

=begin
Further Exploration:

I already modified the wheels method. I moved it into the Vehicle class and just called a WHEELS constant that's defined in each subclass. We would need to ensure a WHEELS constant is defined in each subclass of Vehicle in order to properly utilize the wheels method.
=end