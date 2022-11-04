=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: two sorted arrays
-  Output: a new array with all elements from the input arrays sorted

---

**Problem Domain:**
Nothing specific.
---

**Explicit Requirements:**
- Solution cannot sort the result array.
- Result array must be built one element at a time in the proper order.
- Solution should not mutate the input arrays.
---


**Implicit Requirements:**
- Method must be named #merge
---

**Clarifying Questions:**

1. Can I use Array methods that utilize a <=> method for comparison as long as the method isn't #sort or #sort_by?
  Yes. But do not use #sort, #sort_by, #sort!, or #sort_by!

---

**Mental Model:**

Since both input arrays are sorted, the element at index 0 is always the smallest element in the array, index 1 always has the 2nd smallest element, etc...

Initialize a results array to an empty array.
Keep track of an index variable for both arrays (index_arr1, index_arr2). Initialize both to 0.

If `arr1[index_arr1]` is nil, then add the remaining elements in `arr2` to the results array.
If `arr2[index_arr2]` is nil, then add the remaining elements in `arr1` to the results array.
Compare the elements at the first index of both arrays (arr1[index_arr1] and arr2[index_arr_2]).
  If the `arr1[index_arr1]` element is less than `arr2[index_arr2]`, push the `arr1[index_arr1` element to the results array and increment `index_arr1` by 1. 
  Otherwise, push the `arr2[index_arr2` element to the results array and increment `index_arr2` by 1
Repeat until both arrays are empty.

Return the results array.


---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
merge([], [1, 4, 5]) == [1, 4, 5]
merge([1, 4, 5], []) == [1, 4, 5]

---

Data Structure
--------------
Nothing complex. Use arrays to manage the elements.
---

Algorithm
---------

- Initialize a results array to an empty array.
- Keep track of an index variable for both arrays (index_arr1, index_arr2). Initialize both to 0.

- Enter a loop
  - If `arr1[index_arr1]` is nil, then add the remaining elements in `arr2` to the results array.
  - If `arr2[index_arr2]` is nil, then add the remaining elements in `arr1` to the results array.
  - Compare the elements at the first index of both arrays (arr1[index_arr1] and arr2[index_arr_2]).
    - If the `arr1[index_arr1]` element is less than `arr2[index_arr2]`, push the `arr1[index_arr1` element to the results array and increment `index_arr1` by 1. 
    - Otherwise, push the `arr2[index_arr2` element to the results array and increment `index_arr2` by 1
  - Break out of the loop once the results array size is equal to the combined size of the input arrays.

- Return the results array.

Code
----

=end

def merge(arr1, arr2)
  result = []
  index_arr1 = 0
  index_arr2 = 0
  
  anticipated_result_arr_size = arr1.size + arr2.size
  
  loop do
    if arr1[index_arr1].nil?
      (index_arr2...arr2.size).each do |index|
        result << arr2[index]
      end
    elsif arr2[index_arr2].nil?
      (index_arr1...arr1.size).each do |index|
        result << arr1[index]
      end
    elsif arr1[index_arr1] < arr2[index_arr2]
      result << arr1[index_arr1]
      index_arr1 += 1
    else
      result << arr2[index_arr2]
      index_arr2 += 1
    end

    break if result.size == anticipated_result_arr_size
  end
  
  result
end


p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]

#LS Solution

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