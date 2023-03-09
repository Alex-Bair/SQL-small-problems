=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: An integer representing a positive, natural number
-  Output: A string representing whether the input number is 'abundant', 'perfect', or 'deficient'.

---

**Problem Domain:**

Aliquot sums are the sum of a natural number's positive divisors (not including the number itself).

Ex: The positive divisors of 15 are 1, 3, and 5. 1 + 3 + 5 = 9. 15's Aliquot sum is 9.

Perfect numbers have an Aliquot sum equal to the original number.
Abundant numbers have an Aliquot sum greater than the original number.
Deficient numbers have an Aliquot sum less than the original number.

Examples:
6 is a perfect number. 1 + 2 + 3 = 6
28 is a perfect number. 1 + 2 + 4 + 7 + 14 = 28
15 is a deficient number. 1 + 3 + 5 = 9.
24 is an abundant number. 1 + 2 + 3 + 4 + 6 + 8 + 12 = 36.
Prime numbers are always deficient since their only divisor is 1.

---

**Explicit Requirements:**
- See implicit requirements.
---


**Implicit Requirements:**
- Input will be an integer.
- Output should be a lowercase string
- We must create a custom class called PerfectNumber
- We must have a public method PerfectNumber#classify that accepts the positive natural number as an input, and returns a string that's either 'deficient', 'perfect', or 'abundant'.
- We must raise a StandardError exception if PerfectNumber#classify is passed an invalid argument (i.e. anything that's not a positive natural number.)
- The #classify method must be a public class method.
---

**Clarifying Questions:**

1. Is 1 a perfect number?
  - Yes, assume 1 is a perfect number.

---

**Mental Model:**

- PerfectNumber class
  - #classify method that returns a string based on the sum of the input number's positive divisors
  - #divisors method that returns an array of an input number's positive divisors
  - #validate_input method that raises a StandardError if the input is not a positive integer greater than 0.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

See perfect_numbers_test.rb file for examples.

---

Data Structure
--------------

PerfectNumber class:
  - #classify - returns a string
  - #divisors - returns an array of integers
  - #validate_input - raises a StandardError exception if the input is not a positive integer greater than 0.



---

Algorithm
---------

#divisors
- Initialize an empty array to local variable 'results'
- Iterate from 1 to (input number - 1). Call the block parameter possible_divisor
  - Divide @input_num by possible_divisor. 
    - If the remainder is zero, append possible_divisor to local variable 'results'.
- Return the 'results' array

#classify
- Sum the array returned by passing the input number to the the #divisors method. Assign to local variable 'sum'.
- Compare 'sum' against input number.
  - If 'sum' is greater than the input number, return the string 'abundant'
  - If 'sum' is less than the input number, return the string 'deficient'.
  - Otherwise, return the string 'perfect'

Code
----

=end

class PerfectNumber
  def self.classify(num)
    validate_input(num)
    
    aliquot_sum = divisors(num).sum
    
    if aliquot_sum > num then 'abundant'
    elsif aliquot_sum < num then 'deficient'
    else 'perfect'
    end
  end

  class << self
    private
    
    def validate_input(num)
      raise StandardError unless (num.integer? && num.positive?)
    end
  
    def divisors(num)
      results = []
  
      1.upto(num- 1) do |possible_divisor|
        remainder = num % possible_divisor
        results << possible_divisor if remainder.zero?
      end
  
      results
    end
  end
end