"use strict";
/*

PEDAC Template
==============

A 3x3 matrix can be represented by an array of arrays: an outer array containing three subarrays that each contain three elements. For example, the 3x3 matrix shown below:

1  5  8
4  7  2
3  9  6

is represented by the following array of arrays:

const matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6],
];


The transpose of a 3x3 matrix is the matrix that results from exchanging the rows and columns of the original matrix. For example, the transposition of the matrix shown above is:

1  4  3
5  7  9
8  2  6

Write a function that takes an array of arrays that represents a 3x3 matrix and returns the transpose of the matrix. You should implement the function on your own, without using any external libraries.

Take care not to modify the original matrix — your function must produce a new matrix and leave the input matrix array unchanged.

(Understand the) Problem
------------------------

-  Inputs: an array of 3 arrays, where the subarrays contain 3 elements
-  Output: the transpose of the matrix represented by the input array of arrays. (should also be an array of arrays)

---

**Problem Domain:**

See above for original problem statement.


Given an n x m matrix (n = number of subarrays, m = number of elements within each subarray), the transpose of the matrix will be m x n (m = number of subarrays, n = number of elements within each subarray)

1 2
3 4
5 6

transposes to 

1 3 5
2 4 6

---

**Explicit Requirements:**
- Must return a new array of arrays
- The input matrix array should NOT be mutated or modified

---


**Implicit Requirements:**
- The function name should be transpose
---

**Clarifying Questions:**

1. Will the input "matrix" always be an array containing 3 subarrays with 3 elements each?
  Yes, for this problem.
2. Should the transposed matrix's subarrays' elements be shallow copies of the input matrix's subarrays' elements?
  Yes.
3. Will the subarrays in the input always contain primitive values (strings, numbers, BigInts, etc.)?
  Yes.
4. Will the function always be given exactly one argument?
  Yes.

---

**Mental Model:**

- Determine how many subarrays (n) are in the outer input array, and how many elements (m) are in each subarray.
- Generate an empty "matrix" with `m` subarrays containing `n` empty spots.
- Iterate over the input array. Access the element (AKA `subarray`) and it's index `n` within the iteration.
  - Iterate from 0 to m - 1. Call the iteration number 'm`.
    - On each iteration, assign transposedMatrx[m][n] = inputMatrix[n][m]
- Return the transposed matrix.

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

const matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
];

const newMatrix = transpose(matrix);

console.log(newMatrix);      // [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
console.log(matrix);         // [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

---

Data Structure
--------------

Use an array of array to represent the transposed matrix.


Ex. input array:
matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
];

ex. transposed array
transposedMatrix = [
  [1, 4, 3],
  [5, 7, 9],
  [8, 2, 6]
]

transposedMatrix[0][0] = matrix[0][0]
transposedMatrix[0][1] = matrix[1][0]
transposedMatrix[0][2] = matrix[2][0]
etc.

---

Algorithm
---------

- Determine how many subarrays (n) are in the outer input array, and how many elements (m) are in each subarray.
  - n is the length of the input array
  - m is the length of a subarray
- Generate an empty "matrix" with `m` subarrays containing `n` empty spots.
- Iterate over the input array. Access the element (AKA `subarray`) and it's index `newN` within the iteration.
  - Iterate from 0 to m - 1. Call the iteration number 'newM`.
    - On each iteration, assign transposedMatrx[newM][newN] = inputMatrix[newN][newM]
- Return the transposed matrix.

Code
----

*/

function transpose(matrix) {
  const n = matrix.length;
  const m = matrix[0].length;

  let transposedMatrix = Array(m).fill('').map(_element => Array(n));
  
  for (let newN = 0; newN < n; newN += 1) {
    for (let newM = 0; newM < m; newM += 1) {
      transposedMatrix[newM][newN] = matrix[newN][newM];
    }
  }
  
  return transposedMatrix;
}

const matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
];

const newMatrix = transpose(matrix);

console.log(newMatrix);      // [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
console.log(matrix);         // [[1, 5, 8], [4, 7, 2], [3, 9, 6]]