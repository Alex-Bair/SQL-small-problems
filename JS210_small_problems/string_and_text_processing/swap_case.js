function swapCase(str) {
  return str.split('').map(swapCharacterCase).join('');
}


function swapCharacterCase(char) {
  const LOWERCASE_REGEX = /[a-z]/g;
  if (LOWERCASE_REGEX.test(char)) {
    return char.toUpperCase();
  } else {
    return char.toLowerCase();
  }
}


console.log(swapCase('CamelCase'));              // "cAMELcASE"
console.log(swapCase('Tonight on XYZ-TV'));      // "tONIGHT ON xyz-tv"

// Solution by semel2 using regex and replace

function swapCase(inputString) {
  return inputString.replace(/([a-z])|([A-Z])/g, (_, c1, c2) => (c1||'').toUpperCase() + (c2 || '').toLowerCase());
}