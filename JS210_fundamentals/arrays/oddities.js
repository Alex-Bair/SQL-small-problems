function oddities(array) {
  const oddElements = [];

  for (let i = 0; i < array.length; i += 2) {
    oddElements.push(array[i]);
  }

  return oddElements;
}

oddities([2, 3, 4, 5, 6]) === [2, 4, 6];      // false
oddities(['abc', 'def']) === ['abc'];         // false

/*

Arrays compared with === check if both arrays referenced are the same object (NOT if the contents of the arrays are the same). Since the arrays are separate arrays, the comparison returns false.
If we want to check if the contents of two arrays are the same, we'd need to implement a custom function to do that comparision and not just use the === operator.

*/