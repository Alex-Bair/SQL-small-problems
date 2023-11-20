function isConsonantCharacter(char) {
  const LETTER_REGEX = /[a-z]/ig;
  const VOWEL_REGEX = /[aeiou]/ig;

  return char.match(LETTER_REGEX) && !char.match(VOWEL_REGEX);
}

function doubleConsonants(str) {
  let doubledConsonantString = '';

  for (let char of str) {
    if (isConsonantCharacter(char)) {
      doubledConsonantString += char.repeat(2);
    } else {
      doubledConsonantString += char;
    }
  }

  return doubledConsonantString;
}

console.log(doubleConsonants('String'));          // "SSttrrinngg"
console.log(doubleConsonants('Hello-World!'));    // "HHellllo-WWorrlldd!"
console.log(doubleConsonants('July 4th'));        // "JJullyy 4tthh"
console.log(doubleConsonants(''));                // ""