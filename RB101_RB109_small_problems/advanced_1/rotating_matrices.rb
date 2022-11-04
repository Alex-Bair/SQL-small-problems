=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs: a matrix (array of arrays format)
-  Output: input matrix rotated 90 degrees clockwise

---

**Problem Domain:**
Nothing new (already covered in previous problems).
---

**Explicit Requirements:**
- Must rotate input matrix 90 degrees clockwise
- Must return a new matrix.
- Must not mutate input matrix.

---


**Implicit Requirements:**
- Method must be named #rotate90
---

**Clarifying Questions:**

1. Should the input matrix be mutated?
  No.

---

**Mental Model:**

Determine the size of the outer array. This is the current height / new width.
Determine the size of a subarray. This is the curernt width / new height.

Upside down columns (left to right) in the input matrix become rows (top to bottom )in the output matrix.

Create an empty array. Push 'new_height' number of empty arrays into it. This is the skeleton for the new, rotated array.

Iterate from the left to the right of the matrix. This iterates through the columns left to right.
  Iterate from the bottom to top of the matrix. This iterates through the rows, bottom to top.
    Push the element at the bottom of the current column to the appropriate row in the rotated matrix.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2

---

Data Structure
--------------

Starting matrix can be represented by:

[            #array size = 3
  [0, 1, 2], #row 0
  [3, 4, 5], #row 1
  [6, 7, 8]  #row 2
]

90 degrees clockwise rotation of above array:

[            #array size = 3
  [6, 3, 0], #row 0
  [7, 4, 1], #row 1
  [8, 5, 2]  #row 2
]

Matrix references before transposition, following format matrix[row][column]:
matrix[0][0], matrix[0][1], matrix[0][2]
matrix[1][0], matrix[1][1], matrix[1][2]
matrix[2][0], matrix[2][1], matrix[2][2]


Rotated matrix will be built with  these references to the original matrix, following the format matrix[row][column]:
matrix[2][0], matrix[1][0], matrix[0][0]
matrix[2][1], matrix[1][1], matrix[0][1]
matrix[2][2], matrix[1][2], matrix[0][2]

---

Algorithm
---------

Code
----

=end


def rotate90(matrix)
  new_width = matrix.size
  new_height = matrix[0].size
  
  new_matrix = []
  new_height.times {new_matrix << Array.new}
  
  new_height.times do |new_outer_index|
    new_width.times do |new_inner_index|
      new_matrix[new_outer_index][new_inner_index] = matrix[new_inner_index][new_outer_index]
    end
  end
  
  new_matrix.each {|row| row.reverse!}
end



# matrix1 = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# matrix2 = [
#   [3, 7, 4, 2],
#   [5, 1, 0, 8]
# ]

# new_matrix1 = rotate90(matrix1)
# new_matrix2 = rotate90(matrix2)
# new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

# p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
# p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
# p new_matrix3 == matrix2

#Further Exploration


def rotate(matrix, degrees)
  count = degrees / 90
  new_matrix = matrix
  count.times do
    new_matrix = rotate90(new_matrix)
  end
  new_matrix
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix1 = rotate(matrix1, 90)
p new_matrix1 == [
  [3, 4, 1],
  [9, 7, 5],
  [6, 2, 8]
  ]
  
new_matrix2 = rotate(matrix1, 180)
p new_matrix2 == [
  [6, 9, 3],
  [2, 7, 4],
  [8, 5, 1]
  ]

new_matrix3 = rotate(matrix1, 270)
p new_matrix3 == [
  [8, 2, 6],
  [5, 7, 9],
  [1, 4, 3]
  ]
new_matrix4 = rotate(matrix1, 360)
p new_matrix4 == matrix1