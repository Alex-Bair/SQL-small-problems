=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

Create a clock that is independent of date.

-  Inputs:
-  Output:

---

**Problem Domain:**

---

**Explicit Requirements:**
- Must have a custom Clock class.
- Must be able to add and subtract minutes from the time represented by a Clock object.
- Do not mutate Clock objects when adding or subtracting minutes. Create a new Clock object instead.
- Two clock objects that represent the same time should be equal to each other.
- Do not use any built-in date or time functionality; only use arithmetic operations.
---


**Implicit Requirements:**
- Must have a custom Clock class
- Must have a class method #at that accepts one or two arguments. First argument is the hour, second argument is the minutes.
- Must have a #+ method that adds the passed in argument as minutes to the time represented by the Clock object.
- Must have a #- method (does the opposite of the #+ method)
- Must have a #to_s method that returns a string representation of the Clock object's time.
- Must have a #== method that compares Clock objects' times.
- Valid clock times range from 00:00 to 23:59 (military time?)
---

**Clarifying Questions:**

1. None right now.

---

**Mental Model:**

Clock class
  #at class method => instantiates a new Clock object with the time represented by the passed in arguments. Default to 0 minutes if not provided.
  #initialize => initializes @hours and @minutes to the passed in values
  #+ => adds the passed in value to @minutes (and @hours as appropriate if passed in num is divisible by 60)
  #- => calls the #+ method, but with the negative of the passed in argument.
  #== => compares each clock object's @hours and @minutes to each other
  #to_s => returns a string representation of the clock's time

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

See test cases in clock_test.rb

---

Data Structure
--------------

Clock class
  @hours - integer
  @minutes - integer

---

Algorithm
---------

#+
- Initializes local variables h, m to the quotient and remainder of the input number divided by 60.
- Initialize new_minutes and carryover to the return values of standardize_minutes(@minutes + m) using parallel assignment.
- Initialize new_hours to the return value of standardize_hours(@hours + h + carryover)
- Initialize a new Clock object with h and m passed in as arguments

#- 
- Call #+ but make the argument negative

#standardize_hours(h)
- While h is not between 0 and 24,
  - If h is negative, increment by 24
  - If h is positive, decrement by 24
- Return h

#standardize_minutes(m)
- Initialize local variable carryover to 0
- While m is not less than 60
  - increment carryover by 1
  - decrement m by 60

Code
----

=end

class Clock
  def initialize(h, m = 0)
    @hours = h
    @minutes = m
  end
  
  def self.at(h, m = 0)
    Clock.new(h, m)
  end
  
  def ==(other_clock)
    @hours == other_clock.hours &&
      @minutes == other_clock.minutes
  end
  
  def +(input)
    h, m = input.divmod(60)
    
    new_minutes, carryover = standardize_minutes(@minutes + m)
    new_hours = standardize_hours(@hours + h + carryover)

    Clock.new(new_hours, new_minutes)
  end
  
  def standardize_hours(h)
    loop do
      break if (h >= 0 && h < 24)
      if h.negative?
        h += 24
      elsif h.positive?
        h -= 24
      end
    end
    
    h
  end
  
  def standardize_minutes(m)
    carryover = 0
    loop do
      break if (m < 60)
      carryover += 1
      m -= 60
    end
    
    [m, carryover]
  end
  
  def -(input)
    self.+(input * -1)
  end
  
  def to_s
    "#{format('%02d', @hours)}:#{format('%02d', @minutes)}"
  end
  
  protected
  
  attr_reader :hours, :minutes
end