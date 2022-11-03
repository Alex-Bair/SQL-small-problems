=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: three numbers, representing the length of a triangle's sides
-  Output: symbol representing whether the triangle is equilateral, isosceles, scalene, or invalid

---

**Problem Domain:**

Triangles can be classified based on the length of their sides:

equilateral = all three sides are of equal length
isosceles = two sides are of equal length while the 3rd side is differnt
scalene = all threee sides are of different length

A valid triangle has the following properties:
  - all three sides must have lengths greater than 0
  - sum of the shortest two sides' lengths must be greater than the longest side's length

---

**Explicit Requirements:**
- Must return a symbol
- See Problem Domain for further requirements of each type of triangle
---


**Implicit Requirements:**
- Method must be named #triangle
---

**Clarifying Questions:**

1. None yet.

---

**Mental Model:**

Check if a triangle is valid:
  - Check if all three sides are greater than 0
  - Check if the sum of the shortest two sides' length is greater than the longest side's length

Check how many unique side lengths exist.
  - If only 1 unique side, triangle is equilateral.
  - If two unique sides, triangle is isosceles,
  - If three unique sides, triangle is scalene.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

triangle(3, 3, 3) == :equilateral
triangle(3, 3, 1.5) == :isosceles
triangle(3, 4, 5) == :scalene
triangle(0, 3, 3) == :invalid
triangle(3, 1, 1) == :invalid

---

Data Structure
--------------
Use an array to contain and organize side lengths.
---

Algorithm
---------

- Place input numbers into an sorted array. Assign to 'side_lengths'.
- Determine the number of unique sides in 'side_lengths' array. Assign to variable 'unique_side_count'
- If a side is less than or equal to 0 OR the sum of the shortest two sides' length is less than or equal to  the longest side's length
  - Return :invalid
- Based on the number assigned to 'unique_side_count'
  - If 1, return :equilateral
  - If 2, return :isosceles
  - If 3, return :scalene

Code
----

=end

def triangle(num1, num2, num3)
  side_lengths = [num1.to_f, num2.to_f, num3.to_f].sort
  unique_side_count = side_lengths.uniq.size
  
  return :invalid if invalid?(side_lengths)
  case unique_side_count
  when 1 then :equilateral
  when 2 then :isosceles
  when 3 then :scalene
  end
end

def invalid?(side_lengths_arr)
  side_lengths_arr.any? {|length| length <= 0} || 
  side_lengths_arr[0] + side_lengths_arr[1] <= side_lengths_arr[2]
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid