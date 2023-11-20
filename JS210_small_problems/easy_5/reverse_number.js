"use strict";

function reverseNumber(num) {
  let digits = String(num).split('').reverse();
  let reversedInput = parseInt(digits.join(''), 10);
  console.log(reversedInput);
  return reversedInput;
}

reverseNumber(12345);    // 54321
reverseNumber(12213);    // 31221
reverseNumber(456);      // 654
reverseNumber(12000);    // 21 -- Note that zeros get dropped!
reverseNumber(1);        // 1