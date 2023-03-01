=begin

THe GeoLocation class does not implement a specific #== method, so the #== method call comparing ada.location and grace.location is actually using the BasicObject#== method.
BasicObject#== compares if the two objects are the exact same object, returning true if so and false if they are different. Although ada.location and grace.location have the same @longitude and @latitude values, they are different objects.

To fix this, we need to implement a GeoLocation#== method that compares the @latitude and @longitude values. A custom GeoLocation#== method will override the BasicObject#== method for GeoLocation objects.

=end

class Person
  attr_reader :name
  attr_accessor :location

  def initialize(name)
    @name = name
  end

  def teleport_to(latitude, longitude)
    @location = GeoLocation.new(latitude, longitude)
  end
end

class GeoLocation
  attr_reader :latitude, :longitude

  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def to_s
    "(#{latitude}, #{longitude})"
  end
  
  def ==(other_location)
    latitude == other_location.latitude &&
    longitude == other_location.longitude
  end
  
end

# Example

ada = Person.new('Ada')
ada.location = GeoLocation.new(53.477, -2.236)

grace = Person.new('Grace')
grace.location = GeoLocation.new(-33.89, 151.277)

ada.teleport_to(-33.89, 151.277)

puts ada.location                   # (-33.89, 151.277)
puts grace.location                 # (-33.89, 151.277)
puts ada.location == grace.location # expected: true
                                    # actual: false