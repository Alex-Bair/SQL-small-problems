=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: array
-  Output: new array with elements in reverse order of input array

---

**Problem Domain:**
Reverse means that the element order is reversed, not the contents of the elements.
---

**Implicit Requirements:**
- Only the elements should be reversed in the array, not the contents of the elements.
- The input array should NOT be mutated.
- Do not use Array#reverse or Array#reverse!
- Do not use method written in previous exercise.
---

**Clarifying Questions:**

1. Are duplicate elements possible?
  - Yes, assume duplicate elements can exist.

---

**Mental Model:**
- Iterate over input array, prepending each element to a new array.
---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

reverse([1,2,3,4]) == [4,3,2,1]          # => true
reverse(%w(a b e d c)) == %w(c d e b a)  # => true
reverse(['abc']) == ['abc']              # => true
reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
list.object_id != new_list.object_id  # => true
list == [1, 3, 2]                     # => true
new_list == [2, 3, 1]                 # => true

---

Data Structure
--------------

- Use arrays to manage and contain data.

---

Algorithm
---------

- Create new, empty array.
- Iterate over input array:
  - Prepend each element in the input array to the new array.
- Return the new array.

Code
----

=end

def reverse(input_arr)
  new_arr = []
  input_arr.each do |element|
    new_arr.prepend(element)
  end
  new_arr
end



# Further Exploration

def reverse(input_arr)
  input_arr.each_with_object([]) {|element, new_arr| new_arr.prepend(element)}
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true