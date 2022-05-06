=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: One positive integer
-  Output: A string of altenative 1s and 0s with the same length as the input integer. The string should always start with a 1.

---

**Problem Domain:**

- Nothing specific.

---

**Implicit Requirements:**

- Output string should always start with a 1.

---

**Clarifying Questions:**

1. Is there an upper limit on the possible inputs (ex: is 1000000000000 a valid input?)

---

**Mental Model:**

Iterate between appending 1 or 0 to a string for the specified number of times (input integer).

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

-  Example 1
  -  Inputs: 6
  -  Output: "101010"
-  Example 2
  -  Inputs: 9
  -  Output: '101010101'

---

Data Structure
--------------

Use Integer#times to iterate. Use string to collect 1 or 0 depending on iteration.

---

Algorithm
---------

1. Initialize an empty string.
2. Iterate the number of times specified by input integer.
  2.a. If iteration count is 0 or even, add "1" to the string.
  2.b. Else add "0" to the string.
3. Return string after iteration is complete.

Code
----

=end

def stringy(input_int)
  
  output = ""
  
  input_int.times { |i| i.even? ? output << "1" : output << "0" }
  
  output
  
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'


#Further Exploration

puts "Further Exploration"

# Questions - What should happen if the optional argument is an integer greater than 1? Assume that these cases should also start with 1.

def stringy(input_int, start_num=1)
  
  output = ""
  if start_num == 0
    input_int.times { |i| i.odd? ? output << "1" : output << "0" }
  else
    input_int.times { |i| i.even? ? output << "1" : output << "0" }
  end
  
  output
  
end


puts stringy(9)
puts stringy(9,0)