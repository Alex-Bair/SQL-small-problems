=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: single odd integer n
-  Output: output a 4 pointed diamond who has a maximum width n

---

**Problem Domain:**

---

**Explicit Requirements:**
- Assume n is an odd integer greater than 0.
---


**Implicit Requirements:**
- Diamonds should have the top and bottom points centered in the n x n grid.
- Diamond should be output to the screen.
- Method should be called #diamond
---

**Clarifying Questions:**

1. None yet.

---

**Mental Model:**

Build out the diamond line by line. The spaces on each side of the stars for each line of the diamond are (n - stars) / 2.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

-  Example 1
diamond(1)

*

-  Example 2
diamond(3)

 *
***
 *


-  Example 3
diamond(9)

    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *

---

Data Structure
--------------
Nothing complex.
---

Algorithm
---------

TOP HALF & MIDDLE LINE OF DIAMOND
- Iterate from 1 up to the input integer 'n'. Call the block parameter 'number_of_stars'
  - If 'number_of_stars' is even, skip to the next iteration.
  - Initialize variable 'number_of_spaces' to ('n' - 'number_of_stars') / 2
  - Output the line with spaces times 'number_of_spaces' on each side of the stars.
BOTTOM HALF OF DIAMOND
- Iterate from 'n - 1' down to 1. Call the block parameter 'number_of_stars'
  - If 'number_of_stars' is even, skip to the next iteration.
  - Initialize variable 'number_of_spaces' to ('n' - 'number_of_stars') / 2
  - Output the line with spaces times 'number_of_spaces' on each side of the stars.

Code
----

=end

def print_line(n, number_of_stars)
  number_of_spaces = (n - number_of_stars) / 2
  spaces = ' ' * number_of_spaces
  stars = '*' * number_of_stars
  puts spaces + stars + spaces
end

def diamond(n)
  1.upto(n) do |number_of_stars|
    next if number_of_stars.even?
    print_line(n, number_of_stars)
  end
  (n-1).downto(1) do |number_of_stars|
    next if number_of_stars.even?
    print_line(n, number_of_stars)
  end
end

diamond(9)

#Further Exploration

def print_line(n, star_width)
  number_of_spaces = (n - star_width) / 2
  spaces = ' ' * number_of_spaces
  stars = '*' * star_width
  stars.gsub!('*', ' ')
  stars[0] = '*'
  stars[-1] = '*'
  
  puts spaces + stars + spaces
end

def diamond(n)
  1.upto(n) do |number_of_stars|
    next if number_of_stars.even?
    print_line(n, number_of_stars)
  end
  (n-1).downto(1) do |number_of_stars|
    next if number_of_stars.even?
    print_line(n, number_of_stars)
  end
end

diamond(9)