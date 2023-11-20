function isPalindrome(inputStr) {
  let reversedInput = inputStr.split('').reverse().join('');
  return inputStr === reversedInput;
}

function isRealPalindrome(inputStr) {
  let adjustedInputStr = inputStr.toLowerCase().replace(/[^a-zA-Z0123456789]/g, '');
  return isPalindrome(adjustedInputStr);
}




console.log(isRealPalindrome('madam'));               // true
console.log(isRealPalindrome('Madam'));               // true (case does not matter)
console.log(isRealPalindrome("Madam, I'm Adam"));     // true (only alphanumerics matter)
console.log(isRealPalindrome('356653'));              // true
console.log(isRealPalindrome('356a653'));             // true
console.log(isRealPalindrome('123ab321'));            // false