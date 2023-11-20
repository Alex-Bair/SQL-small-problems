const ALPHABET_REGEX = /[a-zA-Z]/;

function isLetter(char) {
  return !!char.match(ALPHABET_REGEX);
}

function cleanUp(string) {
  let cleanString = '';

  for (let index = 0; index < string.length; index += 1) {
    let currentChar = string[index];
    if (isLetter(currentChar)) {
      cleanString += currentChar;
    } else if (cleanString.at(-1) != ' ') {
      cleanString += ' ';
    }
  }

  return cleanString;
}

console.log(cleanUp("---what's my   +*& line?"));    // " what s my line "

// Solution from Henry Yeary

function cleanUp(string) {
  return string.replace(/[^a-z]+/gi, ' ');
}