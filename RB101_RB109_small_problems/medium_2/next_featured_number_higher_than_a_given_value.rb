=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: single integer
-  Output: integer representing the next featured number greater than the argument OR an error if there is no next featured number

---

**Problem Domain:**

Featured number is an odd number that:
  - is an odd number
  - is a multiple of 7
  - has digits that occur exactly once each

There are no featured numbers above 9,999,999,999 (the next integer will have 11 digits and will have to repeat a digit)

---

**Explicit Requirements:**
- Return the next feature number greater than the integer argument
- Return an error message if there is no next featured number.

---


**Implicit Requirements:**
- Method should be named #featured
---

**Clarifying Questions:**

1. Can the input integer be 0 or negative?
  No, assume a positive integer input.

---

**Mental Model:**

#featured
Enter a loop.
  Increment the input integer by 1.
  Check if the result is an odd number, is a multiple of 7, and has digits that occur exactly once.
  If so break out of the loop and return the number.
  If the number is greater than 9_876_543_210, then break out of the loop and return an error message.
  
#uniq_digits
Convert the number into an array of digits. Check if the number of unique digits equals the number of digits in the array.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

featured(12) == 21
featured(20) == 21
featured(21) == 35
featured(997) == 1029
featured(1029) == 1043
featured(999_999) == 1_023_547
featured(999_999_987) == 1_023_456_987

featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

---

Data Structure
--------------
Nothing complex. Use arrays to manage the digits.
---

Algorithm
---------

#featured
- Initialize variable 'possible_featured_number' to the input integer
- Enter a loop
  - Increment 'possible_featured_number' by 1.
  - Return 'possible_feature_number' if 'posible_feature_number' is:
    - odd AND
    - a multiple of 7 AND
    - has no repeating digits
  - Return an error message if 'possible_feature_number' is greater than 9_876_543_210

Code
----

=end

ERROR = 'There is no possible number that fulfills those requirements.'

def uniq_digit?(num)
  digits = num.to_s.split('')
  digits.size == digits.uniq.size
end

def featured_number?(num)
  (num.odd?) && (num % 7 == 0) && (uniq_digit?(num))
end

def featured(num)
  possible_featured_number = num
  loop do
    possible_featured_number += 1
    return possible_featured_number if featured_number?(possible_featured_number)
    return ERROR if possible_featured_number > 9_876_543_210
  end
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements