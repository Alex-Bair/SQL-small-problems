=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: sorted array of integers
-  Output: returned array of integers

---

**Problem Domain:**
Nothin specific.
---

**Explicit Requirements:**
- New array must be returned
- Returned array must include all missing integers from input array between first and last elements of input array
- Returned array must be sorted from lowest to highest
- Input array will be sorted
---


**Implicit Requirements:**
- Single element input arrays should return an empty array
- Input arrays with no missing elements should return an empty array
- The input array should not be mutated
---

**Clarifying Questions:**

1. Should the input array be mutated?
  No.

---

**Mental Model:**

Initialize a new empty array to contain the missing integers.
Iterate from the first element in the input array to the last element in the input array.
  If the current element is not in the input array, add it to the end of the missing integers array.
Return the missing integers array.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
missing([1, 2, 3, 4]) == []
missing([1, 5]) == [2, 3, 4]
missing([6]) == []

---

Data Structure
--------------
Use an array to contain the missing integers
---

Algorithm
---------
- Initialize a new empty array. Assign to local variable 'missing_nums'
- Iterate from the first element of the input array up to the last element in the input array. Call the block parameter 'num'.
  - If the input array does not include 'num', append it to the 'missing_nums' array.
- Return 'missing_nums'

Code
----

=end


def missing(sorted_array)
  missing_nums = []
  
  low = sorted_array[0]
  high = sorted_array[-1]
  low.upto(high) do |num|
    missing_nums << num if !sorted_array.include?(num)
  end
  
  missing_nums
end


p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

#LS Solution

# Enumerable#each_cons, given the argument n, takes every n consecutive elements from the calling collection and iterates through each sequence of n consecutive items.
# Enumerable#each_slice does the same, but with consecutive non-overlapping sequences.


def missing(array)
  result = []
  array.each_cons(2) do |first, second|
    result.concat(((first + 1)..(second - 1)).to_a)
  end
  result
end

# Further Exploration

=begin

The #min and #max methods could be useful, as well as the #sort and #downto methods. Uisng these methods would take a similar approach to my solution.

The main way I can think of to solve this problem without using a method that requires a block is with while, until, or for loops.
=end

def missing(sorted_array)
  missing_nums = []
  
  low = sorted_array[0]
  high = sorted_array[-1]
  current_num = low + 1
  
  until current_num >= high
    missing_nums << current_num if !sorted_array.include?(current_num)
    current_num += 1
  end
  
  missing_nums
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

# Solution from Jacob Taylor

def missing(arr)
  (arr[0]..arr[-1]).to_a - arr
end