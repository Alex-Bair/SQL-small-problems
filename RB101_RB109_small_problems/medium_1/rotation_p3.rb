=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: integer
-  Output: maximum rotation of the integer argument

---

**Problem Domain:**

Maximum rotation of a number is the result of iteratively rotating the number:
- 1st rotation: rotate entire number
- 2nd rotation: rotate entire number, except for the 1st digit
- 3rd rotation: rotate entire number, except for the first 2 digits
- 4th rotation: rotate entire number, except for the first 3 digits
- Continue rotations in this pattern until no more rotations can be performed.

---

**Implicit Requirements:**

- Can (and should) use the #rotate_rightmost_digits method from the previous exercise.
- Leading zeros should be dropped from the result
- Do not worry about handling multiple zeros.

---

**Clarifying Questions:**

1. Will the input integer argument always be positive?
  - Yes, assume integer argument will always be positive.

---

**Mental Model:**

- Determine number length (how many digits)
- Perform [number length] number of iterations (i = 0..number length - 1)
  - Rotate the number using the rotate_rightmost_digits.
    - # of rightmost digits to rotate will be the number length minus the current iteration
- Return fully rotated number.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845

---

Data Structure
--------------

- Use integers for looping and iterations. Previously created methods will use arrays and strings for rotation.

---

Algorithm
---------

- Determine number length (how many digits in input integer)
- Perform [number length] number of iterations (i = 0...number length)
  - Rotate the number using the rotate_rightmost_digits.
    - # of rightmost digits to rotate will be the number length minus the current iteration
  - Reassign number to output of most recent rotation.
- Return fully rotated number.

Code
----

=end

def rotate_array(input_arr)
  return [] if input_arr.empty?
  rotated_array = input_arr.clone
  rotated_array << rotated_array.shift
end

def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

def max_rotation(int)
  number_of_digits = int.to_s.length

  number_of_digits.times do |i|
    current_rotation_index = number_of_digits - i
    int = rotate_rightmost_digits(int, current_rotation_index)
  end

  int
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

#Further Exploration
=begin

The 3 part approach did make the problem easier to understand, but my mind first thought of a different way to complete the problem that wouldn't use the #rotate_rightmost_digits method.

If we did not have the #rotate_rightmost_digits or #rotate_array methods, my approach and solution to this problem would be different.

My approach (assuming we could not use Array#rotate) would have been to split the integer into an array of it's digits. 
Then loop until the digits array is empty. 
Each loop would move the first element to the end of the array, destructively shift the new first element to a different array, then rinse & repeat until the digits array is empty.
Then the new array of rotated digits would be joined together and converted to an integer.

I wrote this method below. This method above would also preserve consecutive zeros.

=end

def max_rotation(int)
  digits = int.digits.reverse
  rotated_digits = []

  until digits.empty?
    digits << digits.shift
    rotated_digits << digits.shift
  end

  rotated_digits.join.to_i
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845
p max_rotation(1000100100101010010)