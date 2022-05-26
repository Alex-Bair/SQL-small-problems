=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: array of numbers
-  Output: integer representing sum of sums of each leading sub-sequence for the input array. See examples for clarification.

---

**Problem Domain:**
Sub-sequence is a sequence within an overarching sequence. 
---

**Implicit Requirements:**
- Assume input array always contains at least one number.
---

**Clarifying Questions:**

1. Do we need to show the sum of the subsequence sums, or just the final sum?
  - Just the final sum.

---

**Mental Model:**

Determine how many times a given element is added to the final sum. Multiple element by that number. Add product to rolling sum. Repeat for each input array element.

---

Examples / Test Cases / Edge Cases
----------------------------------

sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
sum_of_sums([4]) == 4
sum_of_sums([1, 2, 3, 4, 5]) == 35

---

Data Structure
--------------

- Use arrays to store data. Variables to store sum.

---

Algorithm
---------

- Initialize sum variable.
- Determine input array length.
- Iterate over input array (with index)
  - Multiply current element by array length - index.
  - Add product to sum variable.

Code
----

=end

def sum_of_sums(arr)
  sum = 0
  length = arr.length

  arr.each_with_index do |num, index|
    number_of_additions = length - index
    sum += (num * number_of_additions)
  end

  sum
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35

#LS Solution using Enumerable#reduce
def sum_of_sums(numbers)
  sum_total = 0
  1.upto(numbers.size) do |count|
    sum_total += numbers.slice(0, count).reduce(:+)
  end
  sum_total
end

#Reduce solution from Bethany Pietroniro
def sum_of_sums(nums)
  (0...nums.size).reduce(0) do |sum, index|
    sum + nums[0..index].reduce(:+)
  end 
end