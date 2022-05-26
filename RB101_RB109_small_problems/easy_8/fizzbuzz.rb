=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: two integers (starting and ending number)
-  Output: print out numbers between starting and ending number, but if number is divisible by 3 print "Fizz" or if number is divisible by 5 print "Buzz", or if divisible by both 3 and 5 print "FizzBuzz"

---

**Problem Domain:**
Nothin specific.
---

**Implicit Requirements:**
- Output should be printed to screen.
---

**Clarifying Questions:**

1. Should the numbers in the output be on the same line, or separate lines?
  Same line.

---

**Mental Model:**

Iterate from the starting number up to the ending number.
  If current number is divisible by 3 and 5, print "FizzBuzz"
  If current number is divisible by 3 but not 5, print "Fizz"
  If current number is divisible by 5 but not 3, print "Fuzz"
  If current number is not divisible by 3 or 5, print the number.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

---

Data Structure
--------------

- Use arrays to store data.

---

Algorithm
---------

- Create array of integers from starting number to ending number.
- Transform array:
  - If element is divisible by both 3 and 5, transform to "FizzBuzz"
  - If element is divisible by 3 but not 5, transform to "Fizz"
  - If element is divisible by 5 but not 3, transform to "Buzz"
  - Otherwise, return the element.
- Join the array together using ", " to combine elements into a string.
- Output string to the screen.

Code
----

=end

def divisible_by_x?(num, x)
  num % x == 0
end

def fizzbuzz(start_num, end_num)
  numbers = (start_num..end_num).to_a
  numbers.map! do |element|
    if divisible_by_x?(element, 3) && divisible_by_x?(element, 5)
      "FizzBuzz"
    elsif divisible_by_x?(element, 3)
      "Fizz"
    elsif divisible_by_x?(element, 5)
      "Buzz"
    else
      element
    end
  end
  
  print numbers.join(", ")
end