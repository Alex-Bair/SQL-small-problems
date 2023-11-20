

function stringToInteger(str) {
  const STRING_TO_DIGITS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  let digits = str.split('').reverse().map(d => STRING_TO_DIGITS[d]);

  let num = 0;

  for (let index = 0; index < digits.length; index += 1) {
    num += digits[index] * Math.pow(10, index);
  }

  return num;
}

function stringToSignedInteger(str) {
  let sign = +1;

  if (str[0] === '-') {
    sign = -1;
    str = str.slice(1);
  } else if (str[0] == '+') {
    str = str.slice(1);
  }

  return sign * stringToInteger(str);
}

console.log(stringToSignedInteger('4321'));      // 4321
console.log(stringToSignedInteger('-570'));      // -570
console.log(stringToSignedInteger('+100'));      // 100

// LS Solution

function stringToSignedInteger(string) {
  switch (string[0]) {
    case '-': return -stringToInteger(string.slice(1));
    case '+': return stringToInteger(string.slice(1));
    default:  return stringToInteger(string);
  }
}