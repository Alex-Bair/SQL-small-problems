=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: two integers (number num, number of last digits n to rotate in num)
-  Output: num with the appropriate number of digits rotated

---

**Problem Domain:**
- A single rotation is shifting the leading digit to the last position in the section to be rotated.
---

**Implicit Requirements:**
- Rotating a single digit will result in the original number num to be returned.
- May use rotate_array from the previous exercise.
- Assume n is always a positive integer.
---

**Clarifying Questions:**

1. Will the first number argument ever be negative or a float?
  - Do not consider negative or floats as possible inputs.

---

**Mental Model:**

Convert number num to a string.
Determine section of number to be rotated (last n spots in num_string)
Split num_string into separate strings - first string will be numbers TO NOT rotate, second string will be numbers TO rotate.
Rotate numbers.
Concatenate together unchanged first string with rotated second string.
Convert concatenation to integer.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917

---

Data Structure
--------------

- Use strings for initial manipulation & splitting apart which section to rotate vs. not rotate.
- Use arrays to perform rotation.


---

Algorithm
---------

- Convert number num to a string.
- Determine section of number to be rotated (last n spots in num_string)
- Split num_string into separate strings - first string will be numbers TO NOT rotate, second string will be numbers TO rotate.
- Rotate numbers of second string.
- Concatenate together unchanged first string with rotated second string.
- Convert concatenation to integer.

Code
----

=end

def rotate_array(input_arr)
  return [] if input_arr.empty?
  rotated_array = input_arr.clone
  rotated_array << rotated_array.shift
end

def rotate_string(string)
  rotate_array(string.split('')).join
end

def rotate_rightmost_digits(num, n)
  num_string = num.to_s
  non_rotated_section = num_string[0...-n]
  section_to_rotate = num_string[-n..]

  rotated_section = rotate_string(section_to_rotate)

  (non_rotated_section + rotated_section).to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917

#LS Solution
def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end