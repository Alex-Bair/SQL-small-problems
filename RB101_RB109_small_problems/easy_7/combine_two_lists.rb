=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: two non-empty arrays of the same length
-  Output: one, new array that contains all elements of the first two arrays in alternating order

---

**Problem Domain:**
Nothing specific.
---

**Implicit Requirements:**
- The new array should start with the first element of the first array given.
- Array elements can be any Ruby object.
---

**Clarifying Questions:**

1. Should the input arrays be mutated?
  - No, do not mutate the input arrays.
2. Should the new array elements point to the same elements as the input arrays' elements?
  - Yes.

---

**Mental Model:**

- Add the first element of the first array to an interleave_array.
- Add the first element of the second array to interleave_array.
- Add the second element of the first array to interleave_array.
- Add the second element of the second array to interleave_array.
etc.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

---

Data Structure
--------------

-Use arrays.

---

Algorithm
---------

- Initialize a new array interleave_array.
- Iterate over the first input array, input_array_1.
  - During each iteration with the index i, append the input_array_1[i] element and the input_array_2[i] element to the new array interleave_array.
- Return interleave_array

Code
----

=end

def interleave(arr1, arr2)
  interleave_array = []
  arr1.each_with_index do |_, index|
    interleave_array << arr1[index]
    interleave_array << arr2[index]
  end
  interleave_array
end

#Another option

def interleave(arr1, arr2)
  arr1.each_index.each_with_object([]) do |index, interleave_array|
        interleave_array << arr1[index]
    interleave_array << arr2[index]
  end
end

# Further Exploration

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end