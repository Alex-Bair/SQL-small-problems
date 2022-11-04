=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: a 3 x 3 matrix in Array of Arrays format
-  Output: the transpose of the original matrix

---

**Problem Domain:**

Example Array of Arrays:

[
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8]
]

Transpose of above array:

[
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
]

---

**Explicit Requirements:**
- May not use the Array#transpose method
- May not use the Matrix class from the standard library.
- Do not modify the original matrix.
- Must produce a new matrix and leave the original matrix unchanged
---


**Implicit Requirements:**
- Method name should be #transpose
- Method must accept a 3x3 matrix as an argument
---

**Clarifying Questions:**

1. None yet.

---

**Mental Model:**

Determine the size of the input array. This represents the current height of the input matrix / new width of the matrix / size of the new subarrays. Assign to variable 'new_width'
Determine the size of a subarray in the input array. This represents the current width of the input matrix / new height of the matrix / size of the new outerlevel array. Assign to variable 'new_height'.

Initialize a new empty array. Place 'new_height' number of empty arrays in the overall array. This will be the skeleton for the returned, transposed matrix. Assign to 'new_matrix'.

Assign elements in 'new_matrix' to the elements in the input matrix
  - Iterate from 0 to 'new_height' - 1. Call the block parameter 'new_outer_index'
    - Iterate from 0 to 'new_width' - 1. Call the block parameter 'new_inner_index'.
    
Return 'new_matrix'
  
---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

---

Data Structure
--------------

[            #array size = 3
  [0, 1, 2], #index 0
  [3, 4, 5], #index 1
  [6, 7, 8]  #index 2
]

Transpose of above array:

[            #array size = 3
  [0, 3, 6], #index 0
  [1, 4, 7], #index 1
  [2, 5, 8]  #index 2
]


New matrix will be built with  these references to the original matrix:
matrix[0][0], matrix[1][0], matrix[2][0]
matrix[0][1], matrix[1][1], matrix[2][1]
matrix[0][2], matrix[1][2], matrix[2][2]

---

Algorithm
---------

Code
----

=end

def transpose(matrix)
  new_width = matrix.size
  new_height = matrix[0].size
  
  new_matrix = []
  new_height.times {new_matrix << Array.new}
  
  new_height.times do |new_outer_index|
    new_width.times do |new_inner_index|
      new_matrix[new_outer_index][new_inner_index] = matrix[new_inner_index][new_outer_index]
    end
  end
  
  new_matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

#Further Exploration

def transpose!(matrix)
  height = matrix.size
  width = matrix[0].size
  
  height.times do |outer_index|
    width.times do |inner_index|
      matrix[outer_index][inner_index], matrix[inner_index][outer_index] = matrix[inner_index][outer_index], matrix[outer_index][inner_index]
    end
  end
  
  matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]
transpose!(matrix)

p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]