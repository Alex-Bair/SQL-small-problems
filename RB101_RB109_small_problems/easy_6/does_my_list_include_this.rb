=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: An array and a search value
-  Output: Boolean representing whether search value is in the array (true or false)

---

**Problem Domain:**
Nothing specific.
---

**Implicit Requirements:**
- May not use Array#include? in solution.
- Empty array does not contain nil
---

**Clarifying Questions:**

1. Will the input array always be one dimensional?
  - Yes, assume no nested arrays or elements.

---

**Mental Model:**

- Iterate over array and check if any of the elements are the same as the search value.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

include?([1,2,3,4,5], 3) == true
include?([1,2,3,4,5], 6) == false
include?([], 3) == false
include?([nil], nil) == true
include?([], nil) == false

---

Data Structure
--------------

- Use arrays to store data.

---

Algorithm
---------

- Check if any elements in array are the same as the search value.

Code
----

=end

def include?(array, search_value)
  array.any?(search_value)
end

#LS Solutions
def include?(array, value)
  !!array.find_index(value)
end

def include?(array, value)
  array.each { |element| return true if value == element }
  false
end

#Further Exploration - other options
def include?(array, value)
  !array.select {|element| element == value}.empty?
end

def include?(array, value)
  array.length != array.difference([value]).length
end

def include?(array, value)
  found_value = false
  array.each do |element|
    found_value = true if ((element <=> value) == 0)
  end
  found_value
end


p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false