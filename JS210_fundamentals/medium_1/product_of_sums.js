function productOfSums(array1, array2) {
  let result = total(array1) * total(array2);
  return result;
}

function total(numbers) {
  let sum = 0;

  for (let i = 0; i < numbers.length; i += 1) {
    sum += numbers[i];
  }

  return sum;
}

// The productOfSums function will NOT produce the expected result. One line 7 within the total function, the variable sum is declared, but it is NOT intialized to a value. This will cause the addition and reassignment on line 10 to not perform as intended.

// Also, the toal function does not explicitly return the sum, so it implicitly returns undefined.

console.log(productOfSums([1, 2], [2, 3]));