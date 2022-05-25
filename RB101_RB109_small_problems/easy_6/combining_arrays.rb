=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: Two arrays
-  Output: One array containing all elements from the input arrays, without duplicates.

---

**Problem Domain:**

---

**Implicit Requirements:**
- Duplicates should not exist in returned array.
---

**Clarifying Questions:**

1. Should a new array be returned? i.e. the input arrays should not be mutated
  - Yes
2. Should a specific element order be maintained in the returned array?
  - Yes, elements should be in the same order as the first array, then the second array (minus any duplicates). See example for clarification.
3. Will the input arrays be the same depth?
  - Yes, assume arrays will be the same depth.

---

**Mental Model:**

- Add arrays together and only keep unique values.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

---

Data Structure
--------------

- Use arrays.

---

Algorithm
---------

- Add the two input arrays together.
- Keep only unique values.


Code
----

=end

def merge(arr1, arr2)
  (arr1 + arr2).uniq
end

#LS Solution - used set union (combine without duplicates)

def merge(array_1, array_2)
  array_1 | array_2
end