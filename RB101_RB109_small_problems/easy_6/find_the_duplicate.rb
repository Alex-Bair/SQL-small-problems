=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: Unordered array with only a single value repeated twice.
-  Output: The single value that is repeated within the input array.

---

**Problem Domain:**
Nothing specific.
---

**Implicit Requirements:**
- Input is an unordered array of potentially very large size.
- Only a single value is repeated twice.
- Repeated value should be returned.
---

**Clarifying Questions:**

1. Will the input array contain only integers?
  - No, assume input array could contain any Ruby object (integer, float, string, array, hash, etc.)
2. Does the solution need to be able to scale in case there are more than one value repeated within the array?
  - No, it does not need to scale easily.

---

**Mental Model:**
- Sort input array, but return from the method once the comparison is zero (the same value is being compared to one another).
---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

find_dup([1, 5, 3, 1]) == 1
find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

---

Data Structure
--------------
- Use arrays.
---

Algorithm
---------

- Sort the input array.
  - Standard sort, but return the value once the comparison returns zero (same value compared to itself).

Code
----

=end

def find_dup(input_arr)
  input_arr.sort do |a, b|
    return a if (a <=> b) == 0
    a <=> b
  end
end

p find_dup([1, 5, 3, 1]) == 1
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73
 
def find_dup(input_arr)
  duplicate_values = []
  input_arr.sort do |a, b|
    (duplicate_values << a) if (a <=> b) == 0
    a <=> b
  end
  duplicate_values.uniq
end

#LS Solution
def find_dup(array)
  array.find { |element| array.count(element) == 2 }
end

#Further Exploration
# My solution sorts the input array, and returns the current value once the <=> comparison returns 0 (the value is the same). I like LS's solution better - more idiomatic and can be easily changed to find all duplicate values with Enumerable#find_all.