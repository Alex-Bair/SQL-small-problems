function concat(array1, ...remainingElements) {
  let newArray = array1.slice();
  let array2 = remainingElements.flat();

  for (let index = 0; index < array2.length; index += 1) {
    newArray.push(array2[index]);
  }

  return newArray;
}

console.log(concat([1, 2, 3], [4, 5, 6], [7, 8, 9]));    // [1, 2, 3, 4, 5, 6, 7, 8, 9]
console.log(concat([1, 2], 'a', ['one', 'two']));        // [1, 2, "a", "one", "two"]
console.log(concat([1, 2], ['three'], 4));               // [1, 2, "three", 4]
console.log(concat([1, 2], [[3]]));