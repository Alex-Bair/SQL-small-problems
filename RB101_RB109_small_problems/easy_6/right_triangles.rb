=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: A single positive integer
-  Output: Display of a right riangle whose sides each have n stars

---

**Problem Domain:**

---

**Implicit Requirements:**
- Hypotenuse should have one end at the lower left of the triangle and the other end at the upper right.
---

**Clarifying Questions:**

1. None. Examples make requirements clear.

---

**Mental Model:**

- Output a blank line, then a line with the rightmost space converted to a start, then the next rightmost space converted to a start, etc. until the triangle is fully formed.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

triangle(5)

    *
   **
  ***
 ****
*****

triangle(9)

        *
       **
      ***
     ****
    *****
   ******
  *******
 ********
*********

---

Data Structure
--------------

- Strings should be used for creating the star. Integers will be used for iteration.

---

Algorithm
---------

- Initialize a string of n blank spaces named evolving_string
- Iterate n times.
  - Reassign rightmost index (-1-current_iteration)) of evolving_string to a star.
  - Output evolving string.

Code
----

=end

def triangle(n)
  evolving_string = " " * n
  n.times do |i|
    evolving_string[-1 - i] = "*"
    puts evolving_string
  end
end

# Another option

def triangle(n)
  star = "*"
  n.times do |i|
    number_of_stars = i + 1
    puts (star * number_of_stars).rjust(n)
  end
end

#Further Exploration

#Upside down triangle

def upside_down_triangle(n)
  star = "*"
  n.times do |i|
    number_of_stars = n - i
    puts (star * number_of_stars).rjust(n)
  end
end

#Triangle can be at any corner. right_angle_corner must be two letter string (tl = top left, bl = bottom left, tr = top right, br = bottom right)

STAR = "*"

def triangle(n, right_angle_corner)
  n.times do |i|
    number_of_stars = star_number_determination(n, i, right_angle_corner)
    puts current_star_line(n, number_of_stars, right_angle_corner)
  end
end

def current_star_line(n, number_of_stars, right_angle_corner)
  if right_angle_corner[1] == "r"
    (STAR * number_of_stars).rjust(n)
  else
    (STAR * number_of_stars).ljust(n)
  end
end

def star_number_determination(n, i, right_angle_corner)
  if right_angle_corner[0] == "t"
    n - i
  else
    i + 1
  end
end