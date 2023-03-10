=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

Must create a Robot class that can:
- Assign a random name upon instantiation.
- Be reset (name gets wiped out)
- Can generate a new name (but not the same as previous names.)

---

**Problem Domain:**

Robot names start with two capital letters followed by three digits.

Ex: RX837 or BC811

---

**Explicit Requirements:**
- Robots must have a name generated upon instantiation
- Robot names should be random & not follow a predictable sequence.
- The same name should not be used twice by any Robot object.
---


**Implicit Requirements:**
- Must have a Robot class.
- Must have an #initialize methd
- Must have a #name method
- Must have a #reset method
---

**Clarifying Questions:**

1. None yet.

---

**Mental Model:**

- Robot class
  - @name pointing string of current name
  - @@in_use_names pointing to collection of previous names
  - #name method to expose @name for reading AND generate a name if @name is an empty string
  - #reset method to set @name to an empty string
  - #generate_name method to generate a new name that is not contained in @@in_use_names

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

See test cases in robot_name_test.rb

---

Data Structure
--------------

Robot class
  LETTERS - array of all capital letters
  NUMBERS - array of string version of numbers 0 - 9 
  @name - string
  @@in_use_names - array of strings

---

Algorithm
---------

See Mental Model for details.


Code
----

=end

class Robot
  LETTERS = ('A'..'Z').to_a
  NUMBERS = ('0'..'9').to_a
  
  @@in_use_names = []
  
  def name
    return @name unless @name.empty?
    @name = generate_new_name
  end
  
  def reset
    @@in_use_names.delete(@name)
    @name = ''
  end
  
  def initialize
    @name = generate_new_name
  end
  
  private
  
  def generate_new_name
    n = ''
    
    loop do
      n = ''
      
      2.times {n << LETTERS.sample}
      3.times {n << NUMBERS.sample}
      
      break unless @@in_use_names.include?(n)
    end
    
    @@in_use_names << n
    
    n
  end
end