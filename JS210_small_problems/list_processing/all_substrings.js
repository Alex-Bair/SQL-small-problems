function leadingSubstrings(str) {
  let substrings = [];

  for (let length = 1; length <= str.length; length += 1) {
    substrings.push(str.slice(0, length));
  }

  return substrings;
}

// function substrings(str) {
//   let substringsArray = [];
//   for (let index = 0; index < str.length; index += 1) {
//     let partialStr = str.slice(index);
//     substringsArray = substringsArray.concat(leadingSubstrings(partialStr));
//   }

//   return substringsArray;
// }

console.log(substrings('abcde'));

// // returns
// [ "a", "ab", "abc", "abcd", "abcde",
//   "b", "bc", "bcd", "bcde",
//   "c", "cd", "cde",
//   "d", "de",
//   "e" ]

// Further Exploration

function substrings(str) {
  let partialStrs = str.split('').map((char, index) => str.slice(index));

  return partialStrs.map(leadingSubstrings).flat();
}