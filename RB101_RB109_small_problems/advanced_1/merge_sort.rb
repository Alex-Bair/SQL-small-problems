=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: array containing elements of a single data type (either numbers or strings)
-  Output: a sorted version of the input array

---

**Problem Domain:**

Merge sort is a recursive sorting algorithm that works by breaking down the array elements into nested sub-arrays, then recombining those nested sub-arrays into sorted order.
Ex:
Breaking down:
[9, 5, 7, 1] ->
[[9, 5], [7, 1]] ->
[[[9], [5]], [[7], [1]]]
Merging each pair of nested sub-arrays and sorting.
[[[9], [5]], [[7], [1]]] ->
[[5, 9], [1, 7]] ->
[1, 5, 7, 9]

---

**Explicit Requirements:**
- Assume the input array has elements all of a single data type
- Assume the input array contains only numbers or strings
- Can use merge sort to sort the input array.
---


**Implicit Requirements:**
- Method must be named #merge_sort
---

**Clarifying Questions:**

1. Should the input array be mutated by the #merge_sort method?
  No. Do not mutate the input array.

---

**Mental Model:**

Breaking down:
  Partition the first and second half of the input array into separate subarrays. Continue until all subarrays are of size 1. Do not partition arrays that are already of size 1.


After breaking down step, all elements are in subarrays of size 1 (meaning they are inherently sorted).

Merging & Sorting:
  Combine subarrays (starting with subarrays of size 1 within the same array) using the #merge method to sort them.


---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
merge_sort([5, 3]) == [3, 5]
merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]

---

Data Structure
--------------
Ex: [9, 5, 7, 1] 

Breaking down:
[9, 5, 7, 1] ->
[[9, 5], [7, 1]] ->
[[[9], [5]], [[7], [1]]]
Merging each pair of nested sub-arrays and sorting:
[[[9], [5]], [[7], [1]]] ->
[[5, 9], [1, 7]] ->
[1, 5, 7, 9]


Ex: [6, 2, 7, 1, 4]

Breaking down:
[6, 2, 7, 1, 4] ->
[[6, 2], [7, 1, 4]] ->
[[[6], [2]], [[7], [1, 4]]] ->
[[[6], [2]], [[7], [[1], [4]]]]
Merging each pair of nested sub-arrays and sorting:
[[[6], [2]], [[7], [[1], [4]]]] ->
[[[6], [2]], [[7], [1, 4]]] ->
[[2, 6], [1, 4, 7]] ->
[1, 2, 4, 6, 7]

---

Algorithm
---------

Breaking down:
- Determine the size of the input array. Assign to variable `size`.
- If `size` equals 1, return the input array. ##This is the break condition out of the recursive loop!
- Split the input array into the first half (from index 0 to `size` / 2 - 1) and second half (from index `size` / 2 to `size` - 1 ).
- Repeat above steps until the input arrays are only of size 1.

Merging and sorting AFTER all subarrays are size 1:
- Merge sorted arrays returned from the recursive break down above. Use the #merge method from the previous exercise.

Code
----

=end

def merge(array1, array2)
  index2 = 0
  result = []

  array1.each do |value|
    while index2 < array2.size && array2[index2] <= value
      result << array2[index2]
      index2 += 1
    end
    result << value
  end

  result.concat(array2[index2..-1])
end

def merge_sort(arr)
  
  #Breaking down steps
  size = arr.size
  #If the input arrays is of size 1, then it is already sorted.
  return arr if size == 1
  
  first_half_arr = arr[0...(size/2)]
  second_half_arr = arr[(size/2)...size]
  
  first_half_arr = merge_sort(first_half_arr)
  second_half_arr = merge_sort(second_half_arr)
  
  #At this point, first_half_arr and second_half_arr are sorted arrays.
  
  #Merging steps using returned, sorted arrays first_half_arr and second_half_arr
  merge(first_half_arr, second_half_arr)
end


p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]






def merge_sort(array)
  merge_pairs(divide(array))
end

def divide(array)
  if array.size <= 1
    array
  else
    middle_index = array.length / 2
    [divide(array[0...middle_index]), divide(array[middle_index..-1])]
  end
end

p divide([9, 5, 7, 1]) == [[[9], [5]], [[7], [1]]] # Test case

def merge_pairs(array)
  if array.size <= 1
    array
  else
    merge(merge_pairs(array.first), merge_pairs(array.last))
  end
end

p merge_pairs([[[9], [5]], [[7], [1]]]) == [1, 5, 7, 9] # Test case

p merge_sort([5, 3, 4, 8, 1])