// function range(start, end) {
//   const range = [];

//   for (let element = start; element <= end; element++) {
//     range.push(element);
//   }

//   return range;
// }

// function range(end) {
//   return range(0, end);
// }

// // Examples

// console.log(range(10, 20));
// console.log(range(5));

/*

There can only be a single `range` identifier. We reassign `range` to the function on lines 11 - 13, so we can no longer access the function on lines 1 - 9. This creates an infinite loop where the `range` function on lines 11 - 13 endlessly calls itself.

This can be fixed like below with array deconstruction assignment syntax:

*/

function range(start, end) {

  if (end === undefined) {
    [start, end] = [0, start];
  }

  const range = [];

  for (let element = start; element <= end; element++) {
    range.push(element);
  }

  return range;
}

// Examples

console.log(range(10, 20));
console.log(range(5));