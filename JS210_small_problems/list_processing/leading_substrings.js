// function leadingSubstrings(str) {
//   let substrings = [];

//   for (let length = 1; length <= str.length; length += 1) {
//     substrings.push(str.slice(0, length));
//   }

//   return substrings;
// }

console.log(leadingSubstrings('abc'));      // ["a", "ab", "abc"]
console.log(leadingSubstrings('a'));        // ["a"]
console.log(leadingSubstrings('xyzzy'));    // ["x", "xy", "xyz", "xyzz", "xyzzy"]

// Further Exploration

function leadingSubstrings(str) {
  let characters = str.split('');
  let substringArray = [];
  characters.reduce((acc, char) => {
    acc += char;
    substringArray.push(acc);
    return acc;
  }, '');

  return substringArray;
}