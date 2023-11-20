function pop(array) {
  if (array.length === 0) {
    return undefined;
  }
  
  const value = array[array.length - 1];
  array.length = array.length - 1;
  return value;
}

function push(array, ...values) {
  for (let index = 0; index < values.length; index += 1) {
    array[array.length] = values[index];
  }

  return array.length;
}

// push
const array2 = [1, 2, 3];
console.log(push(array2, 4, 5, 6));              // 6
console.log(array2);                // [1, 2, 3, 4, 5, 6]
console.log(push([1, 2], ['a', 'b']));          // 3
console.log(push([], 1));                       // 1
console.log(push([]));                          // 0