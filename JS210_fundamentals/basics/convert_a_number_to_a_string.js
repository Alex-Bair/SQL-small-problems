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

console.log(integerToString(4321));      // "4321"
console.log(integerToString(0));         // "0"
console.log(integerToString(5000));      // "5000"