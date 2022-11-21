module Walkable
  def walk
    "#{self} #{gait} forward".strip
  end
end

class Person
  attr_reader :name

  include Walkable

  def initialize(name)
    @name = name
  end

  private

  def to_s
    name
  end

  def gait
    "strolls"
  end
end

class Noble < Person
  attr_reader :title

  def initialize(name, title)
    super(name)
    @title = title
  end

  def gait
    'struts'
  end
  
  def to_s
    "#{title} #{name}"
  end
end


byron = Noble.new("Byron", "Lord")
p byron.walk
# => "Lord Byron struts forward"

p byron.name
# => "Byron"
p byron.title
# => "Lord"

=begin
Further Exploration

Save for a later time.
=end