=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: single positive integer
-  Output: array of all positive divisors of input

---

**Problem Domain:**
 Divisor refers to an integerr that can be divided into the input number evenly (does not have a remainder)
---

**Explicit Requirements:**
- Return value can be in whatever sequence we desire.
---


**Implicit Requirements:**
- Return value should be an array
- Only positive divisors should be included
---

**Clarifying Questions:**

1. None right now.

---

**Mental Model:**

Initialize a results array containing the integer 1.
Iterate from 1 up to the input integer. Call the block paramter 'possible_divisor'
  Take the input integer modulo 'possible_divisor'. If the result is 0, append 'possible_divisor' to the results array.
Return the results array.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

divisors(1) == [1]
divisors(7) == [1, 7]
divisors(12) == [1, 2, 3, 4, 6, 12]
divisors(98) == [1, 2, 7, 14, 49, 98]
divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

---

Data Structure
--------------
Use an array to contain the divisors.
---

Algorithm
---------

- Initialize local variable 'results' to an array containing the integer 1.
- Iterate from 2 up to the input integer. Call the block parameter 'possible_divisor'.
  - Take the input integer modulo 'possible_divisor'.
    - If the return value is 0, apppend 'possible_divisor' to the 'results' array.
- Return 'results'

Code
----

=end


def divisors(input_int)
  results = [1]
  
  2.upto(input_int) do |possible_divisor|
    results << possible_divisor if (input_int % possible_divisor == 0)
  end
  
  results
end


# p divisors(1) == [1]
# p divisors(7) == [1, 7]
# p divisors(12) == [1, 2, 3, 4, 6, 12]
# p divisors(98) == [1, 2, 7, 14, 49, 98]
# # p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute


# LS Solution

def divisors(number)
  1.upto(number).select do |candidate|
    number % candidate == 0
  end
end

# Further Exploration

def divisors(input_int)
  results = []
  
  square_root = Math.sqrt(input_int)
  
  1.upto(square_root) do |possible_divisor|
    quotient, remainder = input_int.divmod(possible_divisor)
    
    if remainder == 0
      results << quotient
      results << possible_divisor
    end
  end
  results.uniq.sort
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute