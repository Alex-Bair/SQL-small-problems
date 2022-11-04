=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

TWO METHODS

#egyptian
-  Inputs: a single Rational number as an argument
-  Output: an Array of the denominators that are part of an Egyptian Fraction representation of the input number

#unegyptian
-  Inputs: an Array of the denominators that are part of an Egyptian Fraction representation of a number
-  Output: Rational number represented by the input Egyptian Fraction denominators

---

**Problem Domain:**

Rational Number is any number that can be represented as the result of the division between two integers.
  Top number is the numerator. Bottom number is the denominator.
  
Unit Fractions are a rational number where the numerator is 1.

An Egyption Fraction is the sum of a series of distinct unit fractions (no two are the same).
Ex:

1   1    1    1
- + - + -- + --
2   3   13   15


Every positive rational number can be written as an Egyptian fraction.
Ex:

    1   1   1   1
2 = - + - + - + - 
    1   2   3   6 

Main rules to consider:
- Egyptian fractions are only made up of unit fractions (numerator is always 1).
- Egyptian fraction denominators are always unique (never repeating)

---

**Explicit Requirements:**
- Need to use the Rational calls provided by Ruby
- Must create two methods per problem description
- Since every rational number can be expressed as an Egyption Fraction in an infinite number of different ways, the expected result must conform with the examples given.

---


**Implicit Requirements:**
- Methods must be named #egyptian and #unegyptian
---

**Clarifying Questions:**

1. None yet.

---

**Mental Model:**

Another way of thinking about Egyptian Fraction is below:

    1   1   1   0   0   1
2 = - + - + - + - + - + -
    1   2   3   4   5   6

We iterate the denominator starting at 1 until we have built the complete input rational number.

#egyptian
On each iteration we check:
  - Is the remaining amount (input minus unit fractions within in-progress Egyptian Fraction representation) greater or equal to the Egyptian Fraction denominator represented by the current iteration number?
    - If so, add the denominator to the in-progress Egyptian Fraction representation.
    - If not, continue to the next iteration.

#unegyptian
    - Iterate through the input array of Egyptian Fraction denominators.
    - Calculate a rolling sum of (1 / current Egyptian Fraction denominator)
    - Return the rolling sum.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)

---

Data Structure
--------------
Egyptian Fractions will be represented by an array of denominators:

ex: [1, 2, 3, 6] is the same as

 1   1   1   1
 - + - + - + - 
 1   2   3   6 




---

Algorithm
---------

#unegyptian
- Iterate through the input array.
  - Transform the input array into the rational number of 1 / the current element.
- Sum the transformed array.

#egyptian
- Initialize variable 'input_num' to the input rational number.
- Initialize variable 'egyptian_fraction_denoms' to an empty array.
- Initialize variable 'current_egyptian_fraction_denom' to 1.

- Enter a loop
  - Calculate the current rational number represented by 'egyptian_fraction_denoms'. Assign to variable 'running_total'. Use the #unegyptian method.
  - Break out of the loop if 'input_num' is equal to 'running_total'
  - Check if (`input_num` - `running_total`)  >= the egyptian fraction represented by 'current_egyptian_fraction_denom'
    - If so, append `current_egyptian_fraction_denom' to 'egyptian_fraction_denoms' array.
  - Increment 'current_egyptian_fraction_denom' by 1.

- Return 'egyptian_fraction_denoms'

Code
----

=end

def unegyptian(denominator_arr)
  rational_nums = denominator_arr.map do |denom|
    Rational(1, denom)
  end
  rational_nums.sum
end

def egyptian(input_num)
  egyptian_fraction_denoms = []
  current_egyptian_fraction_denom = 1
  
  loop do
    running_total = unegyptian(egyptian_fraction_denoms)
    break if input_num == running_total
    if input_num - running_total >= unegyptian([current_egyptian_fraction_denom])
      egyptian_fraction_denoms << current_egyptian_fraction_denom
    end
    current_egyptian_fraction_denom += 1
  end
  
  egyptian_fraction_denoms
end

p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)