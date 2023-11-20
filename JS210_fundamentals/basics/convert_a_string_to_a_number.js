const STRING_TO_DIGITS = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

function stringToInteger(str) {
  let digits = str.split('').reverse().map(d => STRING_TO_DIGITS[d]);

  let num = 0;

  for (let index = 0; index < digits.length; index += 1) {
    num += digits[index] * Math.pow(10, index);
  }

  return num;
}

console.log(stringToInteger('4321'));      // 4321
console.log(stringToInteger('570'));       // 570