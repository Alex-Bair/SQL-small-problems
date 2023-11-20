function crunch(string) {
  let result = '';
  let previousCharacter = '';

  for (let index = 0; index < string.length; index += 1) {
    let currentCharacter = string[index];
    if (currentCharacter === previousCharacter) {
      continue;
    }

    result += currentCharacter;
    previousCharacter = currentCharacter;
  }

  return result;
}

function crunch(string) {
  let result = '';

  for (let index = 0; index < string.length; index += 1) {
    let currentCharacter = string[index];
    if (currentCharacter === string[index - 1]) {
      continue;
    }

    result += currentCharacter;
  }

  return result;
}

crunch('ddaaiillyy ddoouubbllee');    // "daily double"
crunch('4444abcabccba');              // "4abcabcba"
crunch('ggggggggggggggg');            // "g"
crunch('a');                          // "a"
crunch('');                           // ""


// Further Exploration

// Regex solution from Christopher Perkins

const crunch = (string) => string.replace(/(.)\1+/g, '$1');