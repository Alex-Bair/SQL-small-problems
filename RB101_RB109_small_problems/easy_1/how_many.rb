=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: an array
-  Output: number of occurences for each element in the array. Print each element alongside the number of occurences.

---

**Problem Domain:**

- Nothing particularly specific.

---

**Implicit Requirements:**

- Elements are case-sensitive

---

**Clarifying Questions:**

1. Are arrays of numbers accepted?
2. Are arrays of arrays or hashes accepted?
3. Are strings and integers of the same value(ex: 4 and "4") not considered duplicates for this exercise?

---

**Mental Model:**

- Determine how many duplicates exist of each element in the array. Print out element & count of how many occurrences for each element.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

-  Example 1
  -  Inputs: 
  
vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

  -  Output: 

car => 4
truck => 3
SUV => 1
motorcycle => 2


Data Structure
--------------

Use a hash to collect number of occurrences for each unique array element. 

---

Algorithm
---------

1. Create an empty hash with default value of zero.
2. Iterate over given array, creating a new key-value pair for each new element seen & incrementing value by 1 for the corresponding key-value pair.
3. Print key-value pairs from hash in prescribed format.

Code
----

=end

def count_occurrences(arr)

  hash = Hash.new(0)
  
  arr.each do |element|
    hash[element] += 1 #LS Solution used  arr.uniq.each do {|element| hash[element] = arr.count(element)}
  end
  
  hash.each_pair {|element, count| puts "#{element} => #{count}"}
  
end


vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)