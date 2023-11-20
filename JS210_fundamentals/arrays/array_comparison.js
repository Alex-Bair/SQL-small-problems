// function areArraysEqual(arr1, arr2) {
//   if (arr1.length !== arr2.length) {
//     return false;
//   }

//   let sortedArr1Copy = arr1.slice().sort();
//   let sortedArr2Copy = arr2.slice().sort();

//   for (let index = 0; index < sortedArr1Copy.length; index += 1) {
//     if (sortedArr1Copy[index] !== sortedArr2Copy[index]) {
//       return false;
//     }
//   }

//   return true;
// }

function areArraysEqual(arr1, arr2) {
  if (arr1.length !== arr2.length) {
    return false;
  }

  let arr2Copy = arr2.slice();

  for (let index = 0; index < arr1.length; index += 1) {
    let arr1Element = arr1[index];
    if (!arr2Copy.includes(arr1Element)) {
      return false;
    }

    arr2Copy.splice(arr2Copy.indexOf(arr1Element), 1);
  }

  return true;
}

console.log(areArraysEqual([1, 2, 3], [1, 2, 3]));                  // true
console.log(areArraysEqual([1, 2, 3], [3, 2, 1]));                  // true
console.log(areArraysEqual(['a', 'b', 'c'], ['b', 'c', 'a']));      // true
console.log(areArraysEqual(['1', 2, 3], [1, 2, 3]));                // false
console.log(areArraysEqual([1, 1, 2, 3], [3, 1, 2, 1]));            // true
console.log(areArraysEqual([1, 2, 3, 4], [1, 1, 2, 3]));            // false
console.log(areArraysEqual([1, 1, 2, 2], [4, 2, 3, 1]));            // false
console.log(areArraysEqual([1, 1, 2], [1, 2, 2]));                  // false
console.log(areArraysEqual([1, 1, 1], [1, 1]));                     // false
console.log(areArraysEqual([1, 1], [1, 1]));                        // true
console.log(areArraysEqual([1, '1'], ['1', 1]));                    // true