=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: three numbers representing the angles of a triangle 
-  Output: symbol representing whether the triangle is right, acute, obtuse, or invalid.

---

**Problem Domain:**
Triangles are classified as follows:

right - one angle of the triangle is a right angle
acute - all 3 angles of the triangle are less than 90 degress
obtuse - one angle is greater than 90 degrees

Valid triangles have:
- the sum of all angles equal 180 degrees
- all angles must be greater than 0

---

**Explicit Requirements:**
- Assume integer value angles to avoid floating point errors.
- Assume arguments are specified in degrees.
---


**Implicit Requirements:**
- Method must be named #triangle
---

**Clarifying Questions:**

1. None yet.

---

**Mental Model:**

Check if the triangle is invalid:
  - Check if the sum of all angles are not equal to 180
  - Check if any angles are less than or equal to 0
  
Determine the maximum angle in the triangle.
  - If the maximum angle is greater than 90, return :obtuse.
  - If the maximum angle is equal to 90, return :right.
  - Otherwise, return :acute

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

triangle(60, 70, 50) == :acute
triangle(30, 90, 60) == :right
triangle(120, 50, 10) == :obtuse
triangle(0, 90, 90) == :invalid
triangle(50, 50, 50) == :invalid

---

Data Structure
--------------

Use an array to manage and organize the angles

---

Algorithm
---------

- Initialize variable 'triangle_angles' to an array of the input numbers.
- Check if the triangle's angles' sum is not equal to 180 OR any of the angles are less than or equal to 0
  - If so, return :invalid
- Determine the maximum value in the 'triangle_angles' array. Based on this value:
  - If greater than 90, return :obtuse
  - If equal to 90, return :right
  - Otherwise, return :acute

Code
----

=end

def triangle(angle1, angle2, angle3)
  triangle_angles = [angle1, angle2, angle3]
  return :invalid if triangle_angles.sum != 180 || triangle_angles.any? {|angle| angle <= 0}
  case triangle_angles.max
  when 91.. then :obtuse
  when 90   then :right
  else           :acute
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid