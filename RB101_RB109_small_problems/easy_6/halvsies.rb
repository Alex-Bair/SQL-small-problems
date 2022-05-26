=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: a single array
-  Output: a single array with two nested arrays containing the first and second half of the input array.

---

**Problem Domain:**
Nothing specific.
---

**Implicit Requirements:**
- If input array has an odd number of elements, the middle element should be placed in the first nested array.
- If input array has one element, the second nested array will be empty.
- If input array is empty, the output nested arrays will be empty.
---

**Clarifying Questions:**

1. Should the output array be a different object from the input array?
  - Assume yes.

---

**Mental Model:**
- Append first half (plus middle element if it exists) of input array to an empty array1.
- Append second half of input array to an empty array2.
- Nest array1 and array2 into an empty array3.
- Return array3.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]

---

Data Structure
--------------

- Use arrays. Output will have nested arrays (2 levels).

---

Algorithm
---------

- Initialize two empty arrays (arr1, arr2).
- Determine length of array / 2. Round up if not an integer. Save as arr1_length.
- Iterate over input array.
  - Append arr's first arr1_length number of elements to arr1.
  - Afterwards, append remaning arr elements to arr2.
- Nest arr1 and arr2 in an empty array.

Code
----

=end

def halvsies(input_arr)
  arr1 = []
  arr2 = []
  arr1_length = (input_arr.length / 2.0).ceil
  input_arr.each_with_index do |element, index|
    if index < arr1_length
      arr1 << element
    else
      arr2 << element
    end
  end
  [arr1, arr2]
end

#LS Solution
def halvsies(array)
  middle = (array.size / 2.0).ceil
  first_half = array.slice(0, middle)
  second_half = array.slice(middle, array.size - middle)
  [first_half, second_half]
end

#Further Exploration

# The solution divides array.size by 2.0 instead of 2 in order to have the proper rounding behaviour. Dividing by 2 will result in integer division, which automatically rounds down to the nearest integer.
# Dividing by 2.0 returns a float, which we then can round up with .ceil.
# My solution was similar to the LS solution, however I used each_with_index to iterate over the input array and append the appropriate number of elements into the first half and second half arrays.
# LS's solution is more concise and easier to follow than mine.