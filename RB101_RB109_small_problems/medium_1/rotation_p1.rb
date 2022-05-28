=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: array
-  Output: new array with the same elements as the array argument, but with the first element rotates to the end of the array.

---

**Problem Domain:**
Nothing specific.
---

**Implicit Requirements:**
- Original array should NOT be mutated.
---

**Clarifying Questions:**

1. What should happen if the array argument is empty?
  - Return a new, empty array.

---

**Mental Model:**

Clone input array. Shift first element of cloned array to the end of the cloned array.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

---

Data Structure
--------------

- Use arrays to store and manipulate data.

---

Algorithm
---------

- Clone input array. 
- Shift first element of cloned array to the end of the cloned array.

Code
----

=end

def rotate_array(input_arr)
  return [] if input_arr.empty?
  rotated_array = input_arr.clone
  rotated_array << rotated_array.shift
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true
p rotate_array([])

#LS Solution

def rotate_array(array)
  array[1..-1] + [array[0]]
end

#Further Exploration

def rotate_string(string)
  rotate_array(string.split('')).join
end

def rotate_integer(int)
  rotate_string(int.to_s).to_i
end