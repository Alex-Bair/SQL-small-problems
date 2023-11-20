// function isUppercase(string) {
//   return string === string.toUpperCase();
// }

console.log(isUppercase('t'));               // false
console.log(isUppercase('T'));               // true
console.log(isUppercase('Four Score'));      // false
console.log(isUppercase('FOUR SCORE'));      // true
console.log(isUppercase('4SCORE!'));         // true
console.log(isUppercase(''));                // true

// LS Solution

// function isUppercase(string) {
//   return !/[a-z]/.test(string);
// }

// Additional Regex Solution

function isUppercase(string) {
  return !string.match(/[a-z]/g);
}