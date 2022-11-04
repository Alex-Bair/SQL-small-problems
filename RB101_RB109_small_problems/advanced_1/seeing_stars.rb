=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: odd integer (n) greater than or equal to 7
-  Output: print out an 8 pointed start in an n x n grid 

---

**Problem Domain:**
Nothing specific.
---

**Explicit Requirements:**
- Assume the input number will always be odd.
- Assume the iput number will always be 7 or greater
---


**Implicit Requirements:**
- Method should be named #star
---

**Clarifying Questions:**

1. None yet.

---

**Mental Model:**

#center_line(n)
Output n stars

#top_half
3 stars on each line. There will be n / 2 lines.
1st line has stars at indices 0, n / 2, and n - 1.
2nd line has stars at indices 1, n / 2, and n - 2.
3rd line has stars at indices 2, n / 2, n - 3.


#bottom_half
Reverse of #top_half method
---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

-  Example 1

star(7)

*  *  *
 * * *
  ***
*******
  ***
 * * *
*  *  *


0  3  6
 1 3 5
  234
*******
  234
 1 3 5
0  3  6



Example 2:

star(9)

*   *   *
 *  *  *
  * * *
   ***
*********
   ***
  * * *
 *  *  *
*   *   *

0   4   8
 1  4  7
  2 4 6
   345
*********
   ***
  * * *
 *  *  *
*   *   *

---

Data Structure
--------------

---

Algorithm
---------

Code
----

=end

def center_line(n)
  puts "*" * n
end

def top_half(n)
  line_count = n / 2

  middle_star_index = line_count
  left_star_index = 0
  right_star_index = n - 1

  line_count.times do
    line = " " * n
    line[middle_star_index] = '*'
    line[left_star_index] = '*'
    line[right_star_index] = '*'
    
    puts line
    
    left_star_index += 1
    right_star_index -= 1
  end
end

def bottom_half(n)
  line_count = n / 2

  middle_star_index = line_count
  left_star_index = middle_star_index - 1
  right_star_index = middle_star_index + 1


  line_count.times do
    line = " " * n
    line[middle_star_index] = '*'
    line[left_star_index] = '*'
    line[right_star_index] = '*'
    
    puts line
    
    left_star_index -= 1
    right_star_index += 1
  end
end

def star(n)
  top_half(n)
  center_line(n)
  bottom_half(n)
end

