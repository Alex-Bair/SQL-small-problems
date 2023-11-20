function reverse(inputForReversal) {
  let reversedInput = []
  let isInputAString = typeof inputForReversal === 'string';

  if (isInputAString) {
    inputForReversal = inputForReversal.split('');
  }

  for (let index = inputForReversal.length - 1; index >= 0; index -= 1) {
    reversedInput.push(inputForReversal[index]);
  }

  if (isInputAString) {
    reversedInput = reversedInput.join('');
  }

  return reversedInput;
}

console.log(reverse('Hello'));           // "olleH"
console.log(reverse('a'));               // "a"
console.log(reverse([1, 2, 3, 4]));      // [4, 3, 2, 1]
console.log(reverse([]));                // []

const array = [1, 2, 3];
console.log(reverse(array));             // [3, 2, 1]
console.log(array);                      // [1, 2, 3]