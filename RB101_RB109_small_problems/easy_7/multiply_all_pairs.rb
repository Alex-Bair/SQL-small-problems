=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: two arrays containing lists of numbers
-  Output: new array containing product of every pair of numbers that can be formed between element of the two input arrays, sorted in increasing value

---

**Problem Domain:**
- Product means multiplication of integers.
---

**Implicit Requirements:**
- Returned array must be sorted by increasing value.
- Only the product of permutations between each separate arrays' elements should be in the returned array. Product of permutations within arrays should not be included.
- Duplicate values should remain in the returned result array.
---

**Clarifying Questions:**

1. Will the input arrays ever have duplicate numbers within themselves? If so, do we treat it as a single element or as many elements as exist in the input array?
  - Yes, this is possible. Treat it as the same number of elements within the input array.

---

**Mental Model:**

Iterate over the first array1. Multiply the current element of array1 to each element of array2. Append result to a results array3.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

---

Data Structure
--------------

- Use arrays to data storage and manipulation.

---

Algorithm
---------

- Initialize an empty results array3.
- Iterate over first array1.
  - Iterate over second array2.
    - Multiply current element of array1 by current element of array 2.
    - Append result to results array3.
- Sort results array3.
Code
----

=end

def multiply_all_pairs(arr1, arr2)
  results = []
  
  arr1.each do |arr1_element|
    arr2.each do |arr2_element|
      results << (arr1_element * arr2_element)
    end
  end
  
  results.sort
end

#Another option

def multiply_all_pairs(arr1, arr2)
  results = arr1.each_with_object([]) do |arr1_element, results|
              arr2.each do |arr2_element|
                results << (arr1_element * arr2_element)
              end
            end
  results.sort
end

#LS Compact Solution - Array#product returns all combinations of elements between given arrays.

def multiply_all_pairs(array_1, array_2)
  array_1.product(array_2).map { |num1, num2| num1 * num2 }.sort
end