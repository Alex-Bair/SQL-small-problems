const RL_SYNC = require('readline-sync');

let integer = parseInt(RL_SYNC.question('Please enter an integer greater than 0: '), 10);
let operation = RL_SYNC.question('Enter "s" to compute the sum, or "p" to compute the product. ');
console.log('');

if (operation === 's') {
  let sum = 0;
  for (let num = 1; num <= integer; num += 1) {
    sum += num;
  }
  console.log(`The sum of the integers between 1 and ${integer} is ${sum}.`);
} else {
  let product = 1;
  for (let num = 1; num <= integer; num += 1) {
    product *= num;
  }
  console.log(`The product of the integers between 1 and ${integer} is ${product}.`);
}

// Further Exploration

function computeSum(arr) {
  return arr.reduce((sum, num) => sum += num);
}

function computeProduct(arr) {
  return arr.reduce((product, num) => product *= num);
}