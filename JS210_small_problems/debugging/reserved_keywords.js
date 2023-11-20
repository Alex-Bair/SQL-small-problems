const RESERVED_KEYWORDS = ['break', 'case', 'catch', 'class', 'const', 'continue',
  'debugger', 'default', 'delete', 'do', 'else', 'enum', 'export', 'extends', 'finally',
  'for', 'function', 'if', 'implements', 'import', 'in', 'instanceof', 'interface',
  'let', 'new', 'package', 'private', 'protected', 'public', 'return', 'static',
  'super', 'switch', 'this', 'throw', 'try', 'typeof', 'var', 'void', 'while',
  'with', 'yield'];

// function isReserved(name) {
//   RESERVED_KEYWORDS.forEach(reserved => {
//     if (name === reserved) {
//       return true;
//     }
//   });

//   return false;
// }

// console.log(isReserved('monkey')); // false
// console.log(isReserved('patch'));  // false
// console.log(isReserved('switch')); // should be: true

/*

The above code is not working as intended because we cannot return early out of iteration when using a list iterator like #forEach, #map, #filter, etc. If we need to return early, we must use a looping mechanism like a for loop or a while loop.

*/

function isReserved(name) {
  for (let index = 0; index < RESERVED_KEYWORDS.length; index += 1) {
    if (name === RESERVED_KEYWORDS[index]) {
      return true;
    }
  }

  return false;
}

console.log(isReserved('monkey')); // false
console.log(isReserved('patch'));  // false
console.log(isReserved('switch')); // true

// Further Exploration

function isReserved(name) {
  return RESERVED_KEYWORDS.includes(name);
}