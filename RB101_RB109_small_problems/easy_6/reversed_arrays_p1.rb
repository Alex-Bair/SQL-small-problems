=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: array
-  Output: input array with elements reversed in place (mutated!)

---

**Problem Domain:**

---

**Implicit Requirements:**
- Only the elements should be reversed in the array, not the contents of the elements.
- The array should be mutated (the same array object should be returned as what's given.)
- Do not use Array#reverse or Array#reverse!

---

**Clarifying Questions:**

1. Will there ever be duplicate elements within the input array?
  - Assume yes, duplicate elements are possible.

---

**Mental Model:**
- Pivot array around centerpoint.

- Determine how many element pairs need swapped (num1).
- Determine max index of input array.
- Iterate num1 times:
  - Reassign the first element with the last element and vice versa.
  - Repeat reassignment for second element and second to last element, etc.
- Return array with elements reversed.
---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1] # true
list == [4, 3, 2, 1] # true
list.object_id == result.object_id # true

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"] # true
list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
reverse!(list) == ["abc"] # true
list == ["abc"] # true

list = []
reverse!(list) == [] # true
list == [] # true

---

Data Structure
--------------

-Use arrays to perform sorting. Make sure to return same array object.

---

Algorithm
---------

- Determine how many element pairs need swapped (num1).
- Determine max index of input array.
- Iterate num1 times:
  - Reassign the first element with the last element and vice versa.
  - Repeat reassignment for second element and second to last element, etc.
- Return array with elements reversed.

Code
----

=end

def reverse!(arr)
  number_to_swap = (arr.length / 2).floor
  max_index = arr.length - 1
  number_to_swap.times do |num|
    arr[num], arr[max_index - num] = arr[max_index - num], arr[num]
  end
  arr
end

# Option below from Adam Dresher. Mutates input array to have index nested with original element, sorts based on index, then removes the index and nested array.

def reverse!(arr)
  p arr.map!.with_index { |ele, i| [ele, i]}
            .sort! { |a, b| b[1] <=> a[1]}
            .map! {|ele| ele[0]}
end