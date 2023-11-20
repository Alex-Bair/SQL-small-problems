function integerToString(num) {
  const BASE = 10;
  const DIGITS_TO_STRING = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  let stringComponents = [];

  do {
    let digit = num % BASE;
    stringComponents.unshift(DIGITS_TO_STRING[digit]);
    num = Math.floor(num / BASE);
  } while (num > 0);

  return stringComponents.join('');
}

function signedIntegerToString(num) {
  let sign = '+';

  if (num < 0 || Object.is(num, -0)) {
    sign = '-';
    num *= -1;
  } else if (Object.is(num, 0)) {
    sign = '';
  }

  return sign + integerToString(num); 
}


console.log(signedIntegerToString(4321));      // "4321"
console.log(signedIntegerToString(0));         // "0"
console.log(signedIntegerToString(-123));      // "-123"
console.log(signedIntegerToString(-0) === "-0");

// LS Solution

// function signedIntegerToString(number) {
//   if (number < 0) {
//     return ('-' + integerToString(-number));
//   } else if (number > 0) {
//     return ('+' + integerToString(number));
//   } else {
//     return integerToString(number);
//   }
// }