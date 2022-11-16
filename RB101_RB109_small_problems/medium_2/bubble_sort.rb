=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: array
-  Output: sorted array

---

**Problem Domain:**

Bubble sort works by making multiple passes (iterations) through the array.
On each pass, each pair of consecutive elements is compared.
  - If the first of the two elements is greater than the second, the two elements are swapped.
This process repeats until a complete iteration through the array is made without performing any swaps.


---

**Explicit Requirements:**
- Sort the input array using the bubble sort algorithm
- Sort will be 'in-place' - meaning we will mutate the array passed in as an argument.
- Assume the array contains at least 2 elements.
---


**Implicit Requirements:**
- Method should be called #bubble_sort!
---

**Clarifying Questions:**

1. Can the input array's elements always be compared with the <=> method?
  Yes, assume so.
2. Only the array should be mutated, not the elements within the array, correct?
  Yes.

---

**Mental Model:**

Enter a loop.
  Initialize a variable 'swap_performed' to false. This will track whether a swap was performed during a pass through the array.
  Iterate from index 0 to index (array size - 2) of the input array.
    If the current element is greater than the next element in the array, swap their place AND flip the 'swap_performed' variable to true.
  If the 'swap_performed' variable is true, go to the next pass.
  Otherwise, break out of the loop.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

array = [5, 3]
bubble_sort!(array)
array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

---

Data Structure
--------------
Nothing complex. See LS exercise page for good visual.
---

Algorithm
---------

- Iniitialize variable 'penultimate_index' to the size of the input array minus 2.
- Enter a loop.
  - Initialize variable 'swap_performed' to false.
  - Iterate from 0 to 'penultimate_index'. Call the block parameter 'index'.
    - If the current element at 'index' is greater than the element at 'index + 1'
      - Swap the elements
      - Assign 'swap_performed' to true.
  - If 'swap_performed' is false, break out of the loop.


Code
----

=end

def bubble_sort!(arr)
  penultimate_index = arr.size - 2
  loop do
    swap_performed = false
    0.upto(penultimate_index) do |index|
      if arr[index] > arr[index + 1]
        arr[index], arr[index + 1] = arr[index + 1], arr[index]
        swap_performed = true
      end
    end
    
    break unless swap_performed
  end
end

#Further Exploration


#The nth pass finds the nth largest element and puts it in its final place. Avoid looking at the last n-1 items when running for the nth time (i.e. those last n-1 items are already sorted)
def bubble_sort!(arr)
  penultimate_index = arr.size - 2
  loop do
    swap_performed = false
    0.upto(penultimate_index) do |index|
      if arr[index] > arr[index + 1]
        arr[index], arr[index + 1] = arr[index + 1], arr[index]
        swap_performed = true
      end
    end
    
    penultimate_index -= 1
    
    break unless swap_performed
  end
end

#More than one element could be placed in the final position on a single pass. Only iterate up to the index that the last swap was performed. Since the first swap will always find the largest value and swap it to the end of the array, this method works.

def bubble_sort!(arr)
  penultimate_index = arr.size - 2
  new_penultimate_index = penultimate_index

  loop do
    0.upto(penultimate_index) do |index|
      if arr[index] > arr[index + 1]
        arr[index], arr[index + 1] = arr[index + 1], arr[index]
        new_penultimate_index = index
      end
    end
    
    penultimate_index = new_penultimate_index
    
    break unless penultimate_index > 1
  end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)