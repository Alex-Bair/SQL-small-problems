function swapFirstAndLastLetters(word) {
  let letters = word.split('');

  [letters[0], letters[letters.length - 1]] = [letters[letters.length - 1], letters[0]];
  return letters.join('');
}

function swap(inputStr) {
  let words = inputStr.split(' ');
  let newWords = words.map(word => swapFirstAndLastLetters(word));

  return newWords.join(' ');
}

console.log(swap('Oh what a wonderful day it is'));  // "hO thaw a londerfuw yad ti si"
console.log(swap('Abcde'));                          // "ebcdA"
console.log(swap('a'));                              // "a"