function showMultiplicativeAverage(arr) {
  let product = arr.reduce((acc, num) => acc * num, 1);

  let result = product / arr.length;
  return result.toFixed(3);
}

console.log(showMultiplicativeAverage([3, 5]));                   // "7.500"
console.log(showMultiplicativeAverage([2, 5, 7, 11, 13, 17]));    // "28361.667"