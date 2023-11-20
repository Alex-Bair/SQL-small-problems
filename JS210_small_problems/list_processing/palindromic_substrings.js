function leadingSubstrings(str) {
  let substrings = [];

  for (let length = 1; length <= str.length; length += 1) {
    substrings.push(str.slice(0, length));
  }

  return substrings;
}

function substrings(str) {
  let substringsArray = [];
  for (let index = 0; index < str.length; index += 1) {
    let partialStr = str.slice(index);
    substringsArray = substringsArray.concat(leadingSubstrings(partialStr));
  }

  return substringsArray;
}

function isPalindrome(str) {
  return (str.length > 1) && (str === str.split('').reverse().join(''));
}

function palindromes(str) {
  return substrings(str).filter(isPalindrome);
}

console.log(palindromes('abcd'));       // []
console.log(palindromes('madam'));      // [ "madam", "ada" ]

console.log(palindromes('hello-madam-did-madam-goodbye'));
// // returns
// // [ "ll", "-madam-", "-madam-did-madam-", "madam", "madam-did-madam", "ada",
// //   "adam-did-mada", "dam-did-mad", "am-did-ma", "m-did-m", "-did-", "did",
// //   "-madam-", "madam", "ada", "oo" ]

console.log(palindromes('knitting cassettes'));
// // returns
// // [ "nittin", "itti", "tt", "ss", "settes", "ette", "tt" ]