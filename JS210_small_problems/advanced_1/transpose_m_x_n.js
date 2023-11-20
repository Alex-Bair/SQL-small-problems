function transpose(matrix) {
  const n = matrix.length;
  const m = matrix[0].length;

  let transposedMatrix = Array(m).fill('').map(_element => Array(n));
  
  for (let newN = 0; newN < n; newN += 1) {
    for (let newM = 0; newM < m; newM += 1) {
      transposedMatrix[newM][newN] = matrix[newN][newM];
    }
  }
  
  console.log(transposedMatrix);
  
  return transposedMatrix;
}

transpose([[1, 2, 3, 4]]);            // [[1], [2], [3], [4]]
transpose([[1], [2], [3], [4]]);      // [[1, 2, 3, 4]]
transpose([[1]]);                     // [[1]]

transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]);
// [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]