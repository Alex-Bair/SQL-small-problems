"use strict";
/*

As we saw in the previous exercises, a matrix can be represented by an array of arrays. For example, the 3x3 matrix shown below:

1  5  8
4  7  2
3  9  6

is represented by the following array of arrays:

const matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6],
];

A 90-degree rotation of a matrix produces a new matrix in which each side of the matrix is rotated clockwise by 90 degrees. For example, the 90-degree rotation of the matrix shown above is:

3  4  1
9  7  5
6  2  8

A 90-degree rotation of a non-square matrix is similar. For example, given the following matrix:


3  4  1
9  7  5

its 90-degree rotation is:


9  3
7  4
5  1

Write a function that takes an arbitrary MxN matrix, rotates it clockwise by 90-degrees as described above, and returns the result as a new matrix. The function should not mutate the original matrix.

PEDAC Template
==============

**Mental Model:**

---

Examples / Test Cases / Edge Cases
----------------------------------

const matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6],
];

const matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8],
];

const newMatrix1 = rotate90(matrix1);
const newMatrix2 = rotate90(matrix2);
const newMatrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))));

console.log(newMatrix1);      // [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
console.log(newMatrix2);      // [[5, 3], [1, 7], [0, 4], [8, 2]]
console.log(newMatrix3);      // `matrix2` --> [[3, 7, 4, 2], [5, 1, 0, 8]]


const matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8],
];

rotatedMatrix2 = [
  [5, 3], 
  [1, 7], 
  [0, 4], 
  [8, 2]
]

rotatedMatrix2[0][0] = matrix2[1][0]
rotatedMatrix2[0][1] = matrix2[0][0]

rotatedMatrix2[1][0] = matrix2[1][1]
rotatedMatrix2[1][1] = matrix2[0][1]

rotatedMatrix2[2][0] = matrix2[1][2]
rotatedMatrix2[2][1] = matrix2[0][2]

rotatedMatrix2[3][0] = matrix2[1][3]
rotatedMatrix2[3][1] = matrix2[0][3]

Pattern:
For an input matrix with n subarrays and m elements within each subarray
Iterate from 0 to (m - 1) (call this number x).
  Iterate from 0 to (n - 1) (call this number y).
    assign rotatedMatrix[x][y] = matrix[(n - 1) - y][x]

---

Data Structure
--------------

---

Algorithm
---------

Code
----

*/

function rotate90(matrix) {
  const n = matrix.length;
  const m = matrix[0].length;

  let rotatedMatrix = Array(m).fill('').map(_element => Array(n));
  
  for (let x = 0; x < m; x += 1) {
    for (let y = 0; y < n; y += 1) {
      rotatedMatrix[x][y] = matrix[(n - 1) - y][x];
    }
  }
  
  return rotatedMatrix;
}

const matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6],
];

const matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8],
];

const newMatrix1 = rotate90(matrix1);
const newMatrix2 = rotate90(matrix2);
const newMatrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))));

console.log(newMatrix1);      // [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
console.log(newMatrix2);      // [[5, 3], [1, 7], [0, 4], [8, 2]]
console.log(newMatrix3);      // `matrix2` --> [[3, 7, 4, 2], [5, 1, 0, 8]]