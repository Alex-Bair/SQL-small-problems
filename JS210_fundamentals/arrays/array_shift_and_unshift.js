function shift(array) {
  if (array.length === 0) {
    return undefined;
  }
  
  array.reverse();
  let value = array.pop();
  array.reverse();
  return value;
}

function unshift(array, ...values) {
  if (array.length === 0) {
    return undefined;
  }

  array.reverse();
  values.reverse();

  for (let index = 0; index < values.length; index += 1) {
    array.push(values[index]);
  }

  return array.reverse().length;
}

console.log(shift([1, 2, 3]));                // 1
console.log(shift([]));                       // undefined
console.log(shift([[1, 2, 3], 4, 5]));        // [1, 2, 3]

console.log(unshift([1, 2, 3], 5, 6));        // 5
console.log(unshift([1, 2, 3]));              // 3
console.log(unshift([4, 5], [1, 2, 3]));      // 3

const testArray = [1, 2, 3];
console.log(shift(testArray));                // 1
console.log(testArray);                       // [2, 3]
console.log(unshift(testArray, 5));           // 3
console.log(testArray);                       // [5, 2, 3]