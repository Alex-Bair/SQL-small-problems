let rlSync = require('readline-sync');

let numbers = [];

let iterations = ['1st', '2nd', '3rd', '4th', '5th', 'last'];

iterations.forEach(function(seq) {
  let num = Number.parseInt(rlSync.question(`Enter the ${seq} number: `), 10);
  numbers.push(num);
});

let lastNum = numbers.pop();

let appearsString = numbers.includes(lastNum) ? 'appears' : 'does not appear';

let output = `The number ${String(lastNum)} ${appearsString} in [${numbers.join(', ')}].`;

console.log(output);

// Further Exploration

function isIncluded(arr, val) {
  return arr.some(element => element > val);
}